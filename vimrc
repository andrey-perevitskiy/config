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
    :let @/ = _s

    :%s/\s\+$//e
endfunction

" Linking the functions
command -nargs=+ MapToggle call MapToggle(<f-args>)
command -nargs=+ MapShowHiddenChars call MapShowHiddenChars(<f-args>)

"  ------
" | Sets |
"  ------
" Show matching braces
set showmatch
" Save after :next and :make
set autowrite
" Show line numbers
set number
set nostartofline
set tabpagemax=50
" View max width column
set colorcolumn=80
" Make mouse scrolling faster
set mouse=a
"set scrolloff=10
"set cursorline
"set formatoptions+=r

" | Indentation |
set shiftwidth=4
" Tab character size
set tabstop=4
set autoindent
set et

"  --------------
" | Key bindings |
"  --------------
MapToggle <F3> hlsearch
nmap <F5> :call RemoveTrailSpaces()<CR>
MapShowHiddenChars <F8>
MapToggle <F9> number
nmap <F10> :IndentLinesToggle<CR>
nmap <F11> :AcpEnable<CR>
nmap <F12> :AcpDisable<CR>
nmap <PageUp> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    \<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    \<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nmap <PageDown> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>

"  -----------
" | Shortcuts |
"  -----------
map <C-a> :tabp<CR>
map <C-d> :tabn<CR>

" Autocompletion popup show shortcut
"inoremap <expr> <C-Space> pumvisible() ? "<C-u>" : "<C-n>"
"imap <C-@> <C-Space>

" Leader shortcuts
let mapleader = ','

" Fast saving
nmap <Leader>w :w!<CR>
" Marks all searched words
nmap <Leader>f :set hlsearch!<CR>
" Copy visual block
map <Leader>c "+y

"  -----------------------
" | Language preferences |
"  -----------------------
filetype plugin indent on

au BufRead,BufNewFile *.py set et ts=4 sw=4 cc=79
au BufRead,BufNewFile *.java set et ts=4 sw=4 cc=80

"  --------------
" | Other things |
"  --------------
" Enable color highlighting
syntax on
" Change color scheme
colorscheme scheme

" | Code autocompletion |
imap {<CR> {<CR><CR>}<UP><TAB>
"imap ( ()<left>
"imap { {}<left>
"imap \" \""<left> \""
"imap ' ''<left>
"imap [ []<left>

" Show full path of the file in the tabs
"source mytabline.vim
"set tabline=%!MyTabLine()

" Retab some file
" set ts=2 noet | retab! | set et ts=4 | retab

"  -----------------
" | Plugin settings |
"  -----------------
" Include plugins
source ~/.vim/plugins/indentLine.vim

" | ACP |
let g:acp_enableAtStartup = 0
let g:acp_behaviorKeywordLength = 4

" | indentLine |
let g:indentLine_color_term = 237
"let g:indentLine_char = '|'
