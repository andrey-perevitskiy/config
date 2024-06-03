let mapleader = ','
let g:vim_json_conceal = 0

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

command -nargs=+ MapToggle call MapToggle(<f-args>)
command -nargs=+ MapShowHiddenChars call MapShowHiddenChars(<f-args>)

set showmatch
set autowrite
set number
set nostartofline
set tabpagemax=50
set colorcolumn=80
set mouse=a
set completeopt=menu,noinsert,menuone
set conceallevel=2
set concealcursor=vin
set shiftwidth=4
set tabstop=4
set autoindent
set et

MapToggle <F3> hlsearch
nmap <F5> :call RemoveTrailSpaces()<CR>
MapShowHiddenChars <F8>
MapToggle <F9> number
nmap <F10> :IndentLinesToggle<CR>
nmap <PageUp> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    \<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nmap <PageDown> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
    \<Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
imap <silent><expr> <TAB> pumvisible() ? "\<CR>" : "\<TAB>"
map <C-a> :tabp<CR>
map <C-d> :tabn<CR>
imap <expr> <C-Space> "<C-n>"
imap <C-@> <C-Space>
nmap <Leader>w :w!<CR>
map <Leader>c "+y
imap {<CR> {<CR><CR>}<UP><TAB>

syntax on
colorscheme default
filetype plugin on
