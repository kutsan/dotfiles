" [a]n [e]ntire buffer motion.
onoremap <silent> ae :<C-u>execute 'normal! m`' <Bar> keepjumps normal! ggVG<Enter>
xnoremap ae GoggV

" [i]nner [l]ine motion.
onoremap <silent> il :<C-u>normal! ^vg_<Enter>
xnoremap il <Esc>^vg_

" Last selected area motion.
onoremap gv :<C-u>normal! gv<Enter>

" End and beginning of line motions.
onoremap H ^
onoremap L $
