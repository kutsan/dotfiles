""
" JavaScript wrapper function for `gf`, `<C-w>f`, `<C-w><C-f>` and `<C-w>gf` keys.
"
" nnoremap <buffer><silent> gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'))<Enter>
" nnoremap <buffer><silent> <C-w>f :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'split')<Enter>
" nnoremap <buffer><silent> <C-w><C-f> :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'split')<Enter>
" nnoremap <buffer><silent> <C-w>gf :call kutsan#ftplugin#javascriptgotofile(expand('<cfile>'), bufname('%'), 'tab split')<Enter>
"
" @param {string} fname Path under the cursor for `gf`.
" @param {string} from Relative buffer path to current working directory.
" @param {string} [command="edit"] Command to be used when opening file.
""
function! kutsan#ftplugin#javascriptgotofile(fname, from, ...) abort
	if empty(a:fname)
		return v:false
	endif

	""
	" Takes a path in various forms and returns resolved absolute path. Acts
	" like wrapper of 'includeexpr' option.
	"
	" @param {string} fname Same as outer function.
	" @param {string} from Same as outer function.
	" @return {string} Resolved path to go or URL if it's core Node module.
	""
	function! s:includeexpr(fname, from) abort
		let l:NODE_CORE_MODULES = [
		\ 	'assert', 'async_hooks', 'buffer', 'child_process', 'cluster', 'crypto',
		\ 	'dgram', 'dns', 'domain', 'events', 'fs', 'http', 'http2', 'https', 'net',
		\ 	'os', 'path', 'perf_hooks', 'punycode', 'querystring', 'readline', 'repl',
		\ 	'stream', 'string_decoder', 'tls', 'tty', 'url', 'util', 'v8', 'vm', 'zlib'
		\ ]

		" If it's a core Node module, then return GitHub URL for module code.
		if index(l:NODE_CORE_MODULES, a:fname) != -1
			return 'https://github.com/nodejs/node/blob/master/lib/' . a:fname . '.js'
		endif

		""
		" Return correct position of path for given 'path'. Checks its existence
		" and try to find correct location.
		"
		" @param {string} path Resolved path after s:resolveform() function.
		" @return {string} Real location of given path.
		""
		function! s:resolvepath(path)
			""
			" Try to find given file path with extensions in 'suffixesadd' option.
			"
			" @param {string} path File path without extension.
			" @return {string} Readable file path with extension or empty string.
			""
			function! s:resolvewithsuffixesadd(path)
				for l:suffix in split(&l:suffixesadd, ',')
					let l:path = a:path . l:suffix
					if filereadable(l:path)
						return l:path
					endif
				endfor
			endfunction

			" Try to match it as a file if the path does not end with a slash or dots.
			if a:path !~# '\v/(\.\.?/?)?$'
				" Try to find without 'suffixesadd'.
				if filereadable(a:path)
					return a:path
				endif

				" Try to find with extensions in 'suffixesadd'.
				let l:path_with_suffix = s:resolvewithsuffixesadd(a:path)
				if !empty(l:path_with_suffix)
					return l:path_with_suffix
				endif
			endif

			if isdirectory(a:path)
				" Try to find under main value for package.json file.
				if filereadable(a:path . '/package.json')
					let l:packagejson = json_decode(join(readfile(a:path . '/package.json')))

					if has_key(l:packagejson, 'main')
						let l:path = s:resolvepath(a:path . '/' . l:packagejson.main)

						if !empty(l:path)
							return l:path
						endif
					endif
				endif

				" Try to find index variants.
				return s:resolvewithsuffixesadd(a:path . '/index')
			endif
		endfunction

		""
		" Return correct form of path for given 'fname'. Checks its form; whether
		" or not absolute path, relative path, bare filename or node module.
		"
		" @param {string} fname Same as outer function.
		" @param {string} from Same as outer function.
		" @return {string} Path in various forms based on 'fname'.
		""
		function! s:resolveform(fname, from)
			let l:fromdirectory = isdirectory(a:from) ? a:from : fnamemodify(a:from, ':h')

			" Absolute path, e.g. '/usr/local/lib/node_modules/example'.
			if a:fname =~# '\v^/'
				" Return absolute path as is.
				return a:fname

			" Relative path, e.g. './example.js', '../example.js' or './example/'.
			elseif a:fname =~# '\v^\.\.?(/|$)'

				" e.g. 'app/./components/Header'.
				return l:fromdirectory . '/' . a:fname

			" Bare filename without leading dots and slashes but with file
			" extension, e.g. 'example.js'.
			elseif a:fname !~# '\v^(/|\./|\.\./)' && filereadable(l:fromdirectory . '/' . a:fname)
				" e.g. 'app/example.js'
				return l:fromdirectory . '/' . a:fname

			" If it's neither core module, absolute path, relative path nor
			" filename; it should be installed module, e.g. 'react'.
			" Note that, it doesn't try to find where node_modules folder at, it
			" thinks your current working directory is git root.
			else
				if !isdirectory(getcwd() . '/node_modules')
					return ''
				endif

				return getcwd() . '/node_modules/' . a:fname
			endif
		endfunction

		return s:resolvepath(s:resolveform(a:fname, a:from))
	endfunction

	let l:path = s:includeexpr(a:fname, a:from)

	" Open in browser if it's URL.
	if l:path =~# '\v^https?://[^ ]+'
		execute 'silent !xdg-open' shellescape(l:path)

		return v:true
	endif

	" Emulate built-in error if file is not found.
	if empty(l:path)
		echohl ErrorMsg
		echomsg "E447: Can't find file \"" . a:fname . "\" in path"
		echohl NONE

		return v:false
	endif

	" Open path.
	execute (a:0 == 1 ? a:1 : 'edit') fnameescape(l:path)
endfunction
