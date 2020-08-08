"  -----------
" | Functions |
"  -----------
function MapToggle(key, opt)
    let cmd = ':set ' . a:opt . '! \| set ' . a:opt . '?<CR>'

    exec 'nnoremap ' . a:key . ' ' . cmd
    exec 'inoremap ' . a:key . ' \<C-o>' . cmd
endfunction

function MapShowHiddenChars(key)
    let cmd = ':set list! \| set list?<CR>'

    exec ':set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<'
    exec 'nnoremap ' . a:key . ' ' . cmd
    exec 'inoremap ' . a:key . ' \<C-o>' . cmd
endfunction

function RemoveTrailSpaces()
    :let _s = @/
    :%s/\s\+$//e
    :let @/ = _s
endfunction

" Linking
command -nargs=+ MapToggle call MapToggle(<f-args>)
command -nargs=+ MapShowHiddenChars call MapShowHiddenChars(<f-args>)

"  ------
" | Sets |
"  ------
set showmatch " show matching braces
set autowrite " save after :next and :make
set number " show line numbers
set nostartofline
set tabpagemax=50
set colorcolumn=80 " view max width column
set mouse=a " make mouse scrolling faster
"set scrolloff=10
"set cursorline
"set formatoptions+=r

" Indentation
set shiftwidth=4
set tabstop=4 " tab character size
set autoindent
set et " don't insert spaces in the tab characters

"  ------
" | Keys |
"  ------
MapToggle <F3> hlsearch
nmap <F5> :call RemoveTrailSpaces()<CR>
MapShowHiddenChars <F8>
MapToggle <F9> number
nmap <F10> :IndentLinesToggle<CR> " toggle indent lines
nmap <F11> :AcpEnable
nmap <F12> :AcpDisable
nmap <PageUp> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    \<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    \<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nmap <PageDown> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>

"  ---------------------
" | Code autocompletion |
"  ---------------------
imap {<CR> {<CR><CR>}<UP><TAB>
"inoremap ( ()<left>
"inoremap { {}<left>
"inoremap \" \""<left> \""
"inoremap ' ''<left>
"inoremap [ []<left>

" ACP
let g:acp_enableAtStartup = 0
let g:acp_behaviorKeywordLength = 4

"  -----------
" | Shortcuts |
"  -----------
map <C-a> :tabp<CR>
map <C-d> :tabn<CR>

" Leader shortcuts
let mapleader = ','

nmap <Leader>w :w!<CR> " fast saving
nmap <Leader>f :set hlsearch!<CR> " marks all searched words
noremap <Leader>c "+y " copy visual block

"  -----------------------
" | Languages preferences |
"  -----------------------
filetype plugin indent on

au BufRead,BufNewFile *.py set et ts=4 sw=4 cc=79
au BufRead,BufNewFile *.java set et ts=4 sw=4 cc=80

"  --------------
" | Other things |
"  --------------
syntax on " enable color highlighting
colorscheme scheme " change color scheme

" Show full path of the file in the tabs
"source mytabline.vim
"set tabline=%!MyTabLine()

" Retab some file
" set ts=2 noet | retab! | set et ts=4 | retab

let g:indentLine_color_term = 237 " change the color of indentLines
"let g:indentLine_char = '|' " change the indentLine char
