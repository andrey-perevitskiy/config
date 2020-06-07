" colors list
" 0: black
" 1: red
" 2: green
" 3: yellow
" 4: blue
" 5: magenta
" 6: cyan
" 7: light gray
" 8: gray

syn region String start=/\v"/ skip=/\v\\./ end=/\v"/

hi Comment      ctermfg=6 ctermbg=0 "cterm=italic
hi Constant     ctermfg=7 ctermbg=0
hi Normal       ctermfg=7 ctermbg=0
hi NonText      ctermfg=7 ctermbg=0

" strings and characters
hi Special      ctermfg=8 ctermbg=0
hi SpecialChar  ctermfg=8 ctermbg=0
hi String       ctermfg=8 ctermbg=0

hi Todo         ctermfg=0 ctermbg=7

hi Cursor       ctermfg=0 ctermbg=7

hi Statement    ctermfg=8 ctermbg=0 "cterm=bold
hi Conditional  ctermfg=8 ctermbg=0 "cterm=bold
hi Repeat       ctermfg=8 ctermbg=0 "cterm=bold
hi Label        ctermfg=8 ctermbg=0 "cterm=bold
hi Operator     ctermfg=8 ctermbg=0 "cterm=bold
hi Keyword      ctermfg=8 ctermbg=0 "cterm=bold

hi Type         ctermfg=8 ctermbg=0 "cterm=bold
hi StorageClass ctermfg=8 ctermbg=0 "cterm=bold
hi Structure    ctermfg=8 ctermbg=0 "cterm=bold
hi Typedef      ctermfg=8 ctermbg=0 "cterm=bold

hi Identifier   ctermfg=8 ctermbg=0
hi Function     ctermfg=8 ctermbg=0

hi VertSplit    ctermfg=0 ctermbg=7

" preprocessor
hi Include      ctermfg=2 ctermbg=0
hi Define       ctermfg=2 ctermbg=0
hi Macro        ctermfg=2 ctermbg=0
hi PreCondit    ctermfg=2 ctermbg=0

" tab bar
hi TabLine      ctermfg=8 ctermbg=0 cterm=none        " not active tab page label
hi TabLineFill  ctermfg=0 ctermbg=7                   " empty tab line where are no labels
hi TabLineSel   ctermfg=7 ctermbg=0                   " active tab page label

hi LineNr       ctermfg=8 ctermbg=0
hi MatchParen   ctermfg=0 ctermbg=7
hi ColorColumn  ctermfg=7 ctermbg=8

" popup menu
hi Pmenu        ctermfg=7 ctermbg=8

" visual
hi Visual       ctermfg=0 ctermbg=2 cterm=none

" current line
"hi CursorLineNr ctermfg=2 ctermbg=0
"hi CursorLine                       cterm=none
"hi CursorColumn                     cterm=none
