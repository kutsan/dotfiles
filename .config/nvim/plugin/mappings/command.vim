" Jump previous and next commands from history.
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Construct substitute command with 'very magic' mode.
cnoremap ;s substitute/\v//gc<Left><Left><Left><Left>

" Construct global command with 'very magic' mode.
cnoremap ;g global/\v/<Left>

" Construct search and replace with populated quickfix list.
cnoremap ;r cdo substitute/<C-r>=@/<CR>//gce<Left><Left><Left><Left>
