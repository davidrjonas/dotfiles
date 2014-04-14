"
" mkdir -p ~/.vim/bundle
" cd ~/.vim/bundle
" git clone git://github.com/gmarik/vundle.git
"
"
set nocompatible               " be iMproved
filetype off                   " required!

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
    let has_vundle=0
endif

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
Bundle 'bling/vim-airline'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mikehaertl/pdv-standalone'
Bundle 'joonty/vdebug.git'
" vim-scripts repos
Bundle 'UltiSnips'
Bundle 'surround.vim'
Bundle 'neocomplcache'
"Bundle 'AutoComplPop'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/mhinz/vim-signify.git'

""" Installing plguins the first time
if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


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
set laststatus=2
set expandtab

let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 0
let g:syntastic_phpcs_disable = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1

set list
set listchars=tab:▸\ ,eol:\ 

let g:syntastic_php_checkers=['php']

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

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy

highlight SignifySignAdd    cterm=bold ctermbg=237 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

highlight Pmenu    ctermbg=darkgray
highlight PmenuSel ctermbg=darkcyan cterm=bold

let mapleader = ","

nmap <Leader>t :!(clear && phpunit --stop-on-failure %)<cr>
nmap <Leader>l :!(php -l %)<cr>
nmap <Leader>x :%s/\s\+$//g<cr>
nmap <Leader>f gqis
nmap <Leader>r :!php --rf <cword><cr>
nmap <Leader>b :b#<cr>
imap t> $this->
