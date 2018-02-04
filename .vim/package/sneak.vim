" Jump to any location specified by two characters.
Plug 'justinmk/vim-sneak'

" Case sensitivity is determined by 'ignorecase' and 'smartcase'.
let g:sneak#use_ic_scs = 1

" Don't do any special handling of file manager buffers.
let g:sneak#map_netrw = 0

" Highlight jump locations like EasyMotion-like jump
let g:sneak#label = 1

" Define 1-char enhanced sneak for find and till.
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
