syn region String start=/\v"/ skip=/\v\\./ end=/\v"/

" Normal text
hi Normal       ctermfg=7    ctermbg=233

" Comment
hi Comment      ctermfg=6    ctermbg=233  "cterm=italic

" Statements
hi Statement    ctermfg=8    ctermbg=233  "cterm=bold
hi Conditional  ctermfg=8    ctermbg=233  "cterm=bold
hi Repeat       ctermfg=8    ctermbg=233  "cterm=bold
hi Label        ctermfg=8    ctermbg=233  "cterm=bold
hi Operator     ctermfg=8    ctermbg=233  "cterm=bold
hi Keyword      ctermfg=8    ctermbg=233  "cterm=bold

" Constants
hi Constant     ctermfg=7    ctermbg=233
hi String       ctermfg=8    ctermbg=233
hi Character    ctermfg=8    ctermbg=233
hi Number       ctermfg=8    ctermbg=233
hi Boolean      ctermfg=8    ctermbg=233
hi Float        ctermfg=8    ctermbg=233

" Special symbols
hi Special      ctermfg=8    ctermbg=233
hi SpecialChar  ctermfg=8    ctermbg=233

" Types
hi Type         ctermfg=8    ctermbg=233  "cterm=bold
hi StorageClass ctermfg=8    ctermbg=233  "cterm=bold
hi Structure    ctermfg=8    ctermbg=233  "cterm=bold
hi Typedef      ctermfg=8    ctermbg=233  "cterm=bold

" Variable names
hi Identifier   ctermfg=8    ctermbg=233
hi Function     ctermfg=8    ctermbg=233

" Preprocessor
hi PreProc      ctermfg=2    ctermbg=233
hi Include      ctermfg=2    ctermbg=233
hi Define       ctermfg=2    ctermbg=233
hi Macro        ctermfg=2    ctermbg=233
hi PreCondit    ctermfg=2    ctermbg=233

" Tabs bar
hi TabLine      ctermfg=8    ctermbg=233  cterm=none   " inactive tab page label
hi TabLineFill  ctermfg=233  ctermbg=7                 " empty tab line, where are no labels
hi TabLineSel   ctermfg=7    ctermbg=233               " active tab page label

" Line numbers
hi LineNr       ctermfg=8    ctermbg=233
hi ColorColumn  ctermfg=7    ctermbg=8

" Popup menu
hi Pmenu        ctermfg=7    ctermbg=8
hi PmenuSel     ctermfg=7    ctermbg=8
hi PmenuSbar    ctermfg=7    ctermbg=8
hi PmenuThumb   ctermfg=7    ctermbg=8

" Visual mode selection
hi Visual       ctermfg=0    ctermbg=2    cterm=none

" Cursor
hi Cursor       ctermfg=0    ctermbg=7
hi MatchParen   ctermfg=0    ctermbg=7

" Current line
"hi CursorLineNr ctermfg=2    ctermbg=0
"hi CursorLine   ctermfg=0    ctermbg=0    cterm=none
"hi CursorColumn ctermfg=0    ctermbg=0    cterm=none

" Other
hi Todo         ctermfg=0    ctermbg=7
hi VertSplit    ctermfg=0    ctermbg=7
hi NonText      ctermfg=7    ctermbg=233
hi Error        ctermfg=none ctermbg=233
