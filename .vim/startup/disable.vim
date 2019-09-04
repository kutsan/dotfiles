" Disable unused built-in plugins.
let g:loaded_gzip = v:true
let g:loaded_rrhelper = v:true
let g:loaded_tarPlugin = v:true
let g:loaded_zipPlugin = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwFileHandlers = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_2html_plugin = v:true
let g:loaded_vimballPlugin = v:true
let g:loaded_getscriptPlugin = v:true
let g:loaded_logipat = v:true
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_matchit = v:true

" Disable navigate tab page mappings.
nnoremap gt <Nop>
nnoremap gT <Nop>

" Disable substitute mappings, use `cl` and `cc`.
nnoremap s <Nop>
nnoremap S <Nop>
xnoremap s <Nop>
xnoremap S <Nop>

" Disable beginning and end of line mappings.
nnoremap ^ <Nop>
xnoremap ^ <Nop>
onoremap ^ <Nop>
nnoremap $ <Nop>
xnoremap $ <Nop>
onoremap $ <Nop>

" Disable navigation mappings for tag stack.
nnoremap <C-t> <Nop>
nnoremap <C-]> <Nop>
nnoremap g<LeftMouse> <Nop>
nnoremap g<RightMouse> <Nop>
nnoremap <C-LeftMouse> <Nop>
nnoremap <C-RightMouse> <Nop>

" Disable find the next pair mappings.
nnoremap % <Nop>
onoremap % <Nop>
xnoremap % <Nop>

" Disable scroll forward and backward mappings.
nnoremap <C-f> <Nop>
nnoremap <C-b> <Nop>

" Disable basic up-down, left-right navigation mappings.
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <C-p> <Nop>
nnoremap <C-n> <Nop>
nnoremap <C-h> <Nop>
nnoremap <C-l> <Nop>
nnoremap <BS> <Nop>
nnoremap <Space> <Nop>

" Disable paste and adjust indent mappings.
nnoremap ]p <Nop>
nnoremap [p <Nop>
nnoremap [P <Nop>
nnoremap ]P <Nop>
nnoremap ]<MiddleMouse> <Nop>

" Disable sleep mapping.
nnoremap gs <Nop>

" Use 'cedit' key to open command-line window.
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

" Disable join mapping.
xnoremap J <Nop>

" Disable lookup the keyword under the cursor mapping.
xnoremap K <Nop>
