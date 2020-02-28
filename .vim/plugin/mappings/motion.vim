" [a]n and [i]n [e]ntire buffer motions.
onoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>
xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>

" [i]nner and [a]round line motions.
onoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
xnoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
onoremap <silent> a_ :<C-u>normal! 0v$<Enter>
xnoremap <silent> a_ :<C-u>normal! 0v$<Enter>

" Last selected area motion.
onoremap gv :<C-u>normal! gv<Enter>

" [i]n and [a]round [i]ndent motions.
onoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<Enter>
xnoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<Enter>
onoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<Enter>
xnoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<Enter>
onoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<Enter>
xnoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<Enter>
