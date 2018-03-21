" Jump to any location specified by two characters.
Plug 'justinmk/vim-sneak'

" Case sensitivity is determined by 'ignorecase' and 'smartcase'.
let g:sneak#use_ic_scs = v:true

" Don't do any special handling of file manager buffers.
let g:sneak#map_netrw = v:false

" Highlight jump locations like EasyMotion.
let g:sneak#label = v:true
