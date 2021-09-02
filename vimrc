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
set cot=menu,noinsert

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

" Autocompletion shortcuts
imap <expr> <C-Space> "<C-n>"
imap <C-@> <C-Space>

" Leader shortcuts
let mapleader = ','

" Fast saving
nmap <Leader>w :w!<CR>
" Marks all searched words
nmap <Leader>f :set hlsearch!<CR>
" Copy visual block
map <Leader>c "+y

"  --------------
" | Other things |
"  --------------
" Enable color highlighting
syntax on
" Change color scheme
colorscheme scheme
" Enable extension check
filetype plugin on

" | Code autocompletion |
imap {<CR> {<CR><CR>}<UP><TAB>
"imap ( ()<left>
"imap { {}<left>
"imap \" \""<left> \""
"imap ' ''<left>
"imap [ []<left>

" Retab some file
" set ts=2 noet | retab! | set et ts=4 | retab

"  -----------------
" | Plugin settings |
"  -----------------
" | indentLine |
let g:indentLine_color_term = 237
"let g:indentLine_char = '|'

" | clang_compete |
let g:clang_library_path='/usr/lib/llvm-7/lib/libclang.so.1'
