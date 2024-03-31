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
set completeopt=menu,noinsert,menuone
set conceallevel=2
set concealcursor=vin

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
nmap <F4> :Autoformat<CR>
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
imap <silent><expr> <TAB> pumvisible() ? "\<CR>" : "\<TAB>"

"  -----------
" | Shortcuts |
"  -----------
map <C-a> :tabp<CR>
map <C-d> :tabn<CR>

" Leader shortcuts
let mapleader = ','

" Autocompletion shortcuts
imap <expr> <C-Space> "<C-n>"
imap <C-@> <C-Space>

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

" | Character autocompletion |
imap {<CR> {<CR><CR>}<UP><TAB>
"imap ( ()<left>
"imap { {}<left>
"inoremap \" \""<left>
"inoremap ' ''<left>
"imap [ []<left>

" Retab some file
" set ts=2 noet | retab! | set et ts=4 | retab

let g:vim_json_conceal = 0

"  -----------------
" | Plugin settings |
"  -----------------
" | indentLine |
"let b:indentLine_enabled = 0
let g:indentLine_color_term = 237
"let g:indentLine_char = '|'

" | clang_compete |
let g:clang_library_path = '/usr/lib/llvm-13/lib/libclang-13.so.1'
let g:clang_snippets = 1
let g:clang_conceal_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_complete_copen = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 0

" | jediVim |
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#use_tabs_not_buffers = 1
