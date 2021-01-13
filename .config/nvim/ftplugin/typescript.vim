" Define 'formatprg'.
let &l:formatprg = printf(
  \ '%s --parser "babel-ts"',
  \ !empty(glob('node_modules/.bin/prettier'))
    \ ? 'node_modules/.bin/prettier'
    \ : 'prettier'
\ )
