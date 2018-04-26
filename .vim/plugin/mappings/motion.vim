" [a]n [e]ntire buffer motion.
onoremap <silent> ae :<C-u>execute 'normal! m`' <Bar> keepjumps normal! ggVG<Enter>
xnoremap ae GoggV

" [i]nner lin[e] motion.
onoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
xnoremap i_ <Esc>^vg_

" Last selected area motion.
onoremap gv :<C-u>normal! gv<Enter>

" Execute a motion on the next or last text object.
onoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
xnoremap <silent> an :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'f' })<Enter>
onoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
xnoremap <silent> in :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'f' })<Enter>
onoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
xnoremap <silent> al :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'a', 'direction': 'F' })<Enter>
onoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
xnoremap <silent> il :<C-u>call kutsan#mappings#motion#next#({ 'motion': 'i', 'direction': 'F' })<Enter>
