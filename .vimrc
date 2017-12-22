set nocompatible		" be iMproved, required
filetype off 			" require

" set the runtime path to include vundle and initialize
set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where vundle should install plugins

    " let Vundle manage Vundle, required*
    Plugin 'VundleVim/Vundle.vim'

    " OPTIONAL PLUGINS
    Plugin 'easymotion/vim-easymotion'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree' 
    Plugin 'kien/ctrlp.vim'
    "Plugin 'python-mode/python-mode'
    Plugin 'myusuf3/numbers.vim'
    "Plugin 'Yggdroot/indentLine'
    Plugin 'townk/vim-autoclose'

    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    Plugin 'Valloric/YouCompleteMe'
    
call vundle#end()		" required
filetype plugin indent on	" required

" for moving lines.
no <down> ddp
no <up> ddkP

" Auto-expand closure
function! AutoExpand(char)
    echom a:char
    echom getline('.')[col('.')-1]

    if getline('.')[col('.')-1] == a:char 
        echom 'character' getline('.')[col('.')-1]
    endif
    return <CR>
endf
"inoremap <CR> <C-c>:call AutoExpand('}')<CR>

inoremap { {<CR>}<ESC>ko
inoremap [<CR> [<CR><BS>]<ESC>ko
inoremap (<CR> (<CR><BS>)<ESC>ko

map <F2> :w !diff % - <enter>
" Auto-center on motion up and down
nmap j jzz
nmap k kzz

" YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_previous_completion = []

" UltiSnips setup
" If this is changed, remember to restart vim. Else it wont be applied
let g:UltiSnipsExpandTrigger = "<S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

" Bindings
nnoremap <leader>gt :YcmCompleter GoTo<CR>

set hlsearch

" Remap for Ctrl-w j to Ctrl-j/k to ease split view navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" numbers.vim command map
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

let g:indentLine_char = '.'
colorscheme badwolf

" For indentation levels 4 and soft tabs.
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4

" Python files setup
:au BufNewFile,BufRead *.py,*.js set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Removes double indent in closures.
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'


:au BufNewFile,BufRead *.html set syntax=html


command! Tree NERDTree
command! Treet NERDTreeToggle

command! W w
command! Q q


" Python - mode settings
let g:pymode_python = 'python3'

" Airline powerline fonts
let g:airline_powerline_fonts = 1

" Stop autocompletion
let g:pymode_rope_completion = 0
