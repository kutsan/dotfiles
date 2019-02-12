""
" Auto-pair plugin that supports multi-character pairs and intelligent matching.
""

" Maintain pair balance when typing an opening and closing character.
let g:pear_tree_smart_openers = v:true
let g:pear_tree_smart_closers = v:true

" Maintain pair balance instead of always deleting empty pairs.
let g:pear_tree_smart_backspace = v:true

" Disable dot-repeatable functionality in favor of consistent behaviour.
let g:pear_tree_repeatable_expand = v:false
