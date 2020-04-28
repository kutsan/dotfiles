""
" Filetype icon support for defx.
""

scriptencoding UTF-8

let g:defx_icons_enable_syntax_highlight = v:true
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '﯂'
let g:defx_icons_parent_icon = ''
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

let g:defx_icons_extensions = {
	\ 'html': { 'icon': '', 'color': 'e67e22' },
	\ 'css': { 'icon': '', 'color': '689fb6' },
	\ 'js': { 'icon': '', 'color': 'f5c06f' },
	\ 'jsx': { 'icon': '', 'color': '689fb6' },
	\ 'md': { 'icon': '', 'color': '44788e' },
	\ 'png': { 'icon': '', 'color': 'd4843e' },
	\ 'webp': { 'icon': '', 'color': '3498db' },
	\ 'jpg': { 'icon': '', 'color': '16a085' },
	\ 'svg': { 'icon': '', 'color': '3affdb' }
\ }

let g:defx_icons_exact_matches = {
	\ 'license': { 'icon': '', 'color': 'f1f1f1' },
	\ 'favicon.ico': { 'icon': '', 'color': '1abc9c' },
	\ 'robots.txt': { 'icon': '', 'color': 'f1f1f1' },
	\ 'node_modules': { 'icon': '', 'color': '82aaff' }
\ }

let g:defx_icon_pattern_matches = {
	\ '.*ignore': { 'icon': '', 'color': '8f93a2' }
\ }

let g:defx_icon_exact_dir_matches = {
	\ 'node_modules': { 'icon': '', 'color': '82aaff' },
	\ '.git': { 'icon': '', 'color': '82aaff' }
\ }
