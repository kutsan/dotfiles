""
" Replace with register operator.
" Modified version of ReplaceWithRegister plugin.
"
" TODO
"	- Full rewrite.
"	- Add usage and function docs.
"	- Remove expression register feature.
""

function! kutsan#mappings#operator#replace#setregister() abort
	let s:register = v:register
endfunction

function! kutsan#mappings#operator#replace#isexprreg() abort
	return (s:register ==# '=')
endfunction

function! s:CorrectForRegtype(type, register, regType, pasteText ) abort
	if a:type ==# 'visual' && visualmode() ==# "\<C-v>" || a:type[0] ==# "\<C-v>"
		let l:pasteLnum = len(split(a:pasteText, "\n"))

		if a:regType ==# 'v' || a:regType ==# 'V' && l:pasteLnum == 1
			let l:height = line("'>") - line("'<") + 1
			if l:height > 1
				call setreg(a:register, join(repeat(split(a:pasteText, "\n"), l:height), "\n"), "\<C-v>")
				return 1
			endif

		elseif a:regType ==# 'V' && l:pasteLnum > 1
			call setreg(a:register, '', "a\<C-v>")
			return 1
		endif
	elseif a:regType ==# 'V' && a:pasteText =~# '\n$'
		call setreg(a:register, strpart(a:pasteText, 0, len(a:pasteText) - 1), 'v')

		return 1
	endif

	return 0
endfunction

function! s:ReplaceWithRegister( type ) abort
	let l:save_clipboard = &clipboard
	set clipboard=
	let l:save_reg = getreg('"')
	let l:save_regmode = getregtype('"')

	let l:pasteRegister = (s:register ==# '"' ? '' : '"' . s:register)
	if s:register ==# '='
		call setreg('"', g:ReplaceWithRegister_expr)
		call s:CorrectForRegtype(a:type, '"', getregtype('"'), g:ReplaceWithRegister_expr)
		let l:pasteRegister = ''
	endif
	try
		if a:type ==# 'visual'
			if &selection ==# 'exclusive' && getpos("'<") == getpos("'>")
				execute 'normal!' l:pasteRegister . 'P'
			else
				execute 'normal! gv' . l:pasteRegister . 'p'
			endif
		else
			function! s:isafter(posA, posB)
				return (a:posA[1] > a:posB[1] || a:posA[1] == a:posB[1] && a:posA[2] > a:posB[2])
			endfunction

			if s:isafter(getpos("'["), getpos("']"))
				execute 'normal!' l:pasteRegister . 'P'
			else
				let l:save_selection = &selection
				set selection=inclusive
				try
					execute 'normal! g`[' . (a:type ==# 'line' ? 'V' : 'v') . 'g`]' . l:pasteRegister . 'p'
				finally
					let &selection = l:save_selection
				endtry
			endif
		endif
	finally
		call setreg('"', l:save_reg, l:save_regmode)
		let &clipboard = l:save_clipboard
	endtry
endfunction

function! kutsan#mappings#operator#replace#operator( type, ... ) abort
	let l:pasteText = getreg(s:register, 1) " Expression evaluation inside function context may cause errors, therefore get unevaluated expression when s:register ==# '='.
	let l:regType = getregtype(s:register)
	let l:isCorrected = s:CorrectForRegtype(a:type, s:register, l:regType, l:pasteText)

	try
		call s:ReplaceWithRegister(a:type)
	finally
		if l:isCorrected
			" Undo the temporary change of the register.
			" Note: This doesn't cause trouble for the read-only registers :, .,
			" %, # and =, because their regtype is always 'v'.
			call setreg(s:register, l:pasteText, l:regType)
		endif
	endtry
endfunction

function! kutsan#mappings#operator#replace#() abort
	call kutsan#mappings#operator#replace#setregister()
	set operatorfunc=kutsan#mappings#operator#replace#operator

	let l:keys = 'g@'

	if ! &l:modifiable || &l:readonly
		let l:keys = ":call setline('.', getline('.'))\<CR>" . l:keys
	endif

	if v:register ==# '='
		let l:keys = ":let g:ReplaceWithRegister_expr = getreg('=')\<CR>" . l:keys
	endif

	return l:keys
endfunction

function! kutsan#mappings#operator#replace#visual() abort
	let l:keys = "1v\<Esc>"
	silent! let l:keys = visualrepeat#reapply#VisualMode(0)
	return l:keys
endfunction
