scriptencoding UTF-8

" File explorer.
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')

" Take the place of default file manager 'netrw'.
let g:vimfiler_as_default_explorer = 1

" Indentation length of tree.
let g:vimfiler_tree_indentation = 2

" Disable showing certain files and folders.
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']

" Disable leaf icon for more simplicity.
let g:vimfiler_tree_leaf_icon = ''

" Use Unicode (from PUA) symbol for open tree.
let g:vimfiler_tree_opened_icon = ''

" Use Unicode (from PUA) symbol for closed tree.
let g:vimfiler_tree_closed_icon = ''

" Use Unicode (from PUA) symbol for read-only files.
let g:vimfiler_readonly_file_icon = ''

" Disable all default key mappings.
let g:vimfiler_no_default_key_mappings = 1

" Define profile options.
call vimfiler#custom#profile(
	\ 'default',
	\ 'context',
	\ {
	\	'explorer': 1,
	\	'find': 0,
	\	'safe': 0,
	\	'split': 0,
	\	'status': 0,
	\	'toggle': 1,
	\	'winwidth': 35
	\ }
\ )

" Open explorer buffer silently.
nnoremap <silent> <Leader>f :VimFiler -explorer -no-focus<Enter>

" vimfiler buffer mappings.
augroup vimfilerkeymappings
	function! s:VimFilerMap(key, value) abort
		execute
			\ 'autocmd FileType vimfiler nmap <buffer><silent><nowait>'
			\ a:key
			\ a:value
	endfunction

	call <SID>VimFilerMap('j', '<Plug>(vimfiler_loop_cursor_down)')
	call <SID>VimFilerMap('k', '<Plug>(vimfiler_loop_cursor_up)')
	call <SID>VimFilerMap('gg', '<Plug>(vimfiler_cursor_top)')
	call <SID>VimFilerMap('a', '<Plug>(vimfiler_toggle_mark_current_line)')
	call <SID>VimFilerMap('v', '<Plug>(vimfiler_toggle_mark_all_lines)')
	call <SID>VimFilerMap('zl', '<Plug>(vimfiler_redraw_screen)')
	call <SID>VimFilerMap('l', '<Plug>(vimfiler_smart_l)')
	call <SID>VimFilerMap('h', '<Plug>(vimfiler_smart_h)')
	call <SID>VimFilerMap('gr', '<Plug>(vimfiler_switch_to_project_directory)')
	call <SID>VimFilerMap('gR', '<Plug>(vimfiler_cd_file)')
	call <SID>VimFilerMap('cf', '<Plug>(vimfiler_new_file)')
	call <SID>VimFilerMap('cd', '<Plug>(vimfiler_make_directory)')
	call <SID>VimFilerMap('r', '<Plug>(vimfiler_rename_file)')
	call <SID>VimFilerMap('dD', '<Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)')
	call <SID>VimFilerMap('dd', '<Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_move_file)')
	call <SID>VimFilerMap('yy', '<Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_copy_file)')
	call <SID>VimFilerMap('p', '<Plug>(vimfiler_clipboard_paste)')
augroup end

" Specific options to use when vimfiler buffer opened.
augroup vimfilerlaunchoptions
	autocmd!

	" Autostart on launch without focus if it's not Android.
	autocmd VimEnter *
		\ if (system('uname --operating-system') !~# 'Android' && &l:filetype !=# 'gitcommit') |
			\ VimFiler -explorer -no-focus -find |
		\ endif

	" Disable line numbers completely.
	autocmd FileType vimfiler setlocal nonumber norelativenumber

	" Disable tilde characters.
	autocmd FileType vimfiler highlight EndOfBuffer guifg=bg
augroup end
