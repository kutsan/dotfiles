" Define 'formatprg'.
let &l:formatprg = printf(
  \ '%s --parser "yaml"',
  \ !empty(glob('node_modules/.bin/prettier'))
    \ ? 'node_modules/.bin/prettier'
    \ : 'prettier'
\ )
