" [a]n and [i]n [e]ntire buffer motions.
onoremap <silent> ie :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'i' })<Enter>
xnoremap <silent> ie :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'i' })<Enter>
onoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'a' })<Enter>
xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#({ 'mode': 'a' })<Enter>

" [i]nner and [a]round line motions.
onoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
xnoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
onoremap <silent> a_ :<C-u>normal! 0v$<Enter>
xnoremap <silent> a_ :<C-u>normal! 0v$<Enter>

" Last selected area motion.
onoremap gv :<C-u>normal! gv<Enter>

" [i]n and [a]round [i]ndent motions.
onoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'i' })<Enter>
xnoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'i' })<Enter>
onoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'a' })<Enter>
xnoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'motion': 'a' })<Enter>

" Execute a motion on the next or last text object.
onoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
xnoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
onoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
xnoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
onoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
xnoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
onoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
xnoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
