" [a]n [e]ntire buffer motions.
onoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>
xnoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>

" [i]nner line motion.
onoremap <silent> i_ :<C-u>normal! ^vg_<CR>
xnoremap <silent> i_ :<C-u>normal! ^vg_<CR>

" [i]n and [a]round [i]ndent motions.
onoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<CR>
xnoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<CR>
onoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<CR>
xnoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<CR>
onoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<CR>
xnoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<CR>
