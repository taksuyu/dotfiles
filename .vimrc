""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"Plugin 'dag/vim-fish'
Plugin 'jmcantrell/vim-virtualenv'

call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = "sol"
"let g:airline_powerline_fonts = 1
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '>>'
let g:airline_right_sep = '<'
let g:airline_right_alt_sep = '<<'
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extentions#tabline#left_sep = '>'
let g:airline#extentions#tabline#left_alt_sep = '>>'
"let g:airline#extentions#tabline#show_tab_type = 0
"let g:airline#extentions#tabline#close_symbol = 'X'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-session
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_autosave = 'no'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set number
set laststatus=2
set showtabline=2
set noshowmode
set timeoutlen=50

" File changed from the outside
set autoread

set ruler

set backspace=eol,start,indent

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set incsearch

autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r

" center screen
nmap <space> zz
" center during searches
nmap n nzz
nmap N Nzz
" normalize paragraph
nmap Q gqip
vmap Q gqip
" insert newline non-insert
nmap <CR> o<Esc>
nmap <Backspace> O<Esc>

" Note: Move to the next tab! By Questor
nnoremap <silent> [5;5~ :tabnext<cr>
inoremap <silent> [5;5~ <C-O>:tabnext<cr>
vnoremap <silent> [5;5~ :<C-U>tabnext<cr>v

" Note: Move to the previous tab! By Questor
nnoremap <silent> [6;5~ :tabprevious<cr>
inoremap <silent> [6;5~ <C-O>:tabprevious<cr>
vnoremap <silent> [6;5~ :<C-U>tabprevious<cr>v

" markdown .md filetypes
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Hightlight tabs and trailing whitespace
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black
