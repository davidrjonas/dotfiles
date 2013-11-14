"
" mkdir -p ~/.vim/bundle
" cd ~/.vim/bundle
" git clone git://github.com/gmarik/vundle.git
" 
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'extradite.vim'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-markdown'
"Bundle 'ervandew/supertab'
""undle 'mikehaertl/pdv-standalone'
" vim-scripts repos
Bundle 'UltiSnips'
Bundle 'surround.vim'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'neocomplcache'
" Bundle 'PIV'
Bundle 'Distinguished'


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.


set encoding=utf-8
set t_Co=256
syntax enable
set showcmd
set hlsearch
set tabstop=4 shiftwidth=4
set showmatch
set matchtime=2
set ignorecase
set smartcase
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set path=.,/home/staging/php
set laststatus=2
set expandtab
" set list
" set listchars=trail:~

let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 0
"let g:Powerline_symbols = 'fancy'
let g:SuperTabDefaultCompletionType = "context"
let g:syntastic_phpcs_disable = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

let g:neocomplcache_enable_auto_select = 1

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


set list
set listchars=tab:▸\ ,eol:\ 

hi Pmenu ctermbg=darkgray
hi PmenuSel ctermbg=darkcyan cterm=bold


