let colors_name="scheme"

filetype plugin indent on

syntax on " enable color highlight
colorscheme scheme " change color scheme

"set formatoptions+=r " good option
set showmatch " show matching braces
set autowrite " save after :next and :make
set number " show line numbers
set nostartofline
set tabpagemax=50
set autoindent
"set scrolloff=10
"set cursorline

" indentation
set shiftwidth=4
set tabstop=4 " change tab size
"set autoindent
set expandtab " don't insert spaces in tabs

set colorcolumn=80 " view max width column

map <C-a> :tabp<CR>
map <C-d> :tabn<CR>

" well... it's how ctrl+w, just ,+w
let mapleader=","

" fast saving
nmap <leader>w :w!<cr>

" marks all searched words
nmap <leader>f :set hlsearch!<cr>

nmap <PageUp> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nmap <PageDown> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>

" remove all trailing whitespace
nmap <F5> :let _s=@/<bar>:%s/\s\+$//e<Bar>:let @/=_s<bar><cr>

" Map key to toggle opt
function MapToggle(key, opt)
    let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
    exec 'nnoremap '.a:key.' '.cmd
    exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

function ShowNewLines(key)
    let cmd = ':set list! \| set list?<CR>'
    exec ':set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<'
    exec 'nnoremap '.a:key.' '.cmd
    exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ ShowNewLines call ShowNewLines(<f-args>)

" hide numbers column
MapToggle <F3> hlsearch

ShowNewLines <F8>

MapToggle <F9> number

" draw indent lines enable/disable
nmap <F10> :IndentLinesToggle<cr>

" autocompletion enable/disable
nmap <F11> :AcpEnable
nmap <F12> :AcpDisable

let g:acp_enableAtStartup=0
let g:acp_behaviorKeywordLength=4

" show full path of file in tabs
"source mytabline.vim
"set tabline=%!MyTabLine()

" if you want retab something file (put this inside vim command line)
" set ts=2 noet | retab! | set et ts=4 | retab

" auto completion
imap {<CR> {<CR><CR>}<UP><TAB>
"inoremap ( ()<left>
"inoremap { {}<left>
"inoremap \" \""<left> \" like that line below, just for double quote
						" uncomment this removing \
"inoremap ' ''<left>
"inoremap [ []<left>

" faster mouse scrolling
set mouse=a

"language preferences
au BufRead,BufNewFile *.py set et ts=4 sw=4 cc=79
au BufRead,BufNewFile *.java set et ts=4 sw=4 cc=80
