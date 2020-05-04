" [a]n [e]ntire buffer motions.
onoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>
xnoremap <silent> ae :<C-u>call kutsan#mappings#motion#entire#()<Enter>

" [i]n and [a]round [i]ndent motions.
onoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<Enter>
xnoremap <silent> ii :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<Enter>
onoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<Enter>
xnoremap <silent> ai :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<Enter>
onoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<Enter>
xnoremap <silent> io :<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<Enter>
