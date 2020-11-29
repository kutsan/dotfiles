silent! call defx#custom#option('_', {
	\ 'columns': 'indent:icons:filename',
	\ 'winwidth': 30,
	\ 'split': exists('$ANDROID_ROOT') ? 'no' : 'vertical',
	\ 'direction': 'topleft',
	\ 'ignored_files': '',
	\ 'show_ignored_files': v:true,
	\ 'toggle': v:true,
	\ 'buffer_name': 'explorer',
	\ 'listed': v:true,
	\ 'resume': v:true
\ })

" Launch Defx.
nnoremap <silent> <Leader>f :Defx<CR>
nnoremap <silent> <Leader>F :Defx -no-toggle -search=`expand('%:p')` `getcwd()`<CR>

augroup defxsettings
	autocmd!

	" Set common settings.
	autocmd FileType defx setlocal statusline=defx signcolumn=yes nonumber

	" Set mappings.
	autocmd FileType defx call s:defxmappings()

	function! s:defxmappings() abort
		" Navigation
		nnoremap <buffer><silent><expr> l
			\ defx#is_directory()
				\ ? defx#do_action('open_or_close_tree')
				\ : defx#do_action('drop')
		nnoremap <buffer><silent><expr> <2-LeftMouse>
			\ defx#is_directory()
				\ ? defx#do_action('open_or_close_tree')
				\ : defx#do_action('drop')
		nnoremap <buffer><silent><expr> h defx#do_action('close_tree')
		nnoremap <buffer><silent><expr> L defx#do_action('cd', defx#get_candidate().action__path)
		nnoremap <buffer><silent><expr> H defx#do_action('cd', ['..'])
		nnoremap <buffer><silent><expr> gh defx#do_action('cd', getcwd())
		nnoremap <buffer><silent><expr> ~ defx#do_action('open_tree_recursive')

		" Selection
		nnoremap <buffer><silent><expr> a defx#do_action('toggle_select') .. 'j'
		xnoremap <buffer><silent><expr> a defx#do_action('toggle_select_visual')
		nnoremap <buffer><silent><expr> uv defx#do_action('clear_select_all')

		" Operations
		nnoremap <buffer><silent><expr> yy defx#do_action('copy')
		xnoremap <buffer><silent><expr> yy defx#do_action('copy')
		nnoremap <buffer><silent><expr> dd defx#do_action('move')
		nnoremap <buffer><silent><expr> dD defx#do_action('remove_trash')
		nnoremap <buffer><silent><expr> p defx#do_action('paste')
		nnoremap <buffer><silent><expr> r defx#do_action('rename')
		nnoremap <buffer><silent><expr><nowait> c defx#do_action('new_multiple_files')

		" Other
		nnoremap <buffer><silent><expr> <C-r> defx#do_action('redraw')
		nnoremap <buffer><silent><expr> <C-g> defx#do_action('print')
		nnoremap <buffer><silent><expr> zh defx#do_action('toggle_ignored_files')
		nnoremap <buffer><silent><expr> ypf defx#do_action('yank_path')
	endfunction
augroup end
