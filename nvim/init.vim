
" https://github.com/junegunn/vim-plug
" PlugInstall PlugUpdate
call plug#begin()

Plug 'badwolf'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dietsche/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'yaifa.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'UltiSnips'
Plug 'extradite.vim'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'vimwiki/vimwiki'
"Plug 'joonty/vdebug.git'
"Plugin 'Tagbar'

" == languages ==
Plug 'm2mdas/phpcomplete-extended', { 'for': 'php' }
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
" update to syntax file
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'm2mdas/phpcomplete-extended-laravel', { 'for': 'php' }
Plug 'm2mdas/phpcomplete-extended-symfony', { 'for': 'php' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
"Plug 'derekwyatt/vim-scala'
"Plug 'zah/nimrod.vim'
Plug 'flazz/vim-colorschemes'

call plug#end()

set encoding=utf-8
set fileencoding=utf-8
"set t_Co=256
set tabstop=4 shiftwidth=4
set showmatch
set matchtime=2
set smartcase
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set expandtab
set hidden
set list
set mouse=
set listchars=tab:▸\ ,eol:\ 
set noeb vb t_vb=

colorscheme badwolf

let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
"let g:tagbar_autofocus = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
au CompleteDone * pclose!

let g:UltiSnipsSnippetDirectories = [$HOME.'/Documents/dotfiles/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy

highlight SignifySignAdd    cterm=bold ctermbg=237 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

highlight ExtraWhitespace ctermbg=52 guibg=52
match ExtraWhitespace /\s\+$/

imap jk <Esc>
imap jj <Esc>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let mapleader = ","

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <Leader>x :%s/\s\+$//g<cr>
nnoremap <Leader>f gqis
nnoremap <Leader>b :b#<cr>
nnoremap <Leader>a :ls<cr>:b 
nnoremap <Leader>d :echom system("date")<cr>
"nmap <Leader><Leader> :TagbarToggle<cr>
nnoremap <Leader>p :set invpaste<cr>
nnoremap <Leader>z 1z=
nnoremap z<Leader> 1z=
nnoremap <C-l> :mode<cr>
xnoremap <Leader>s <esc>:'<,'>:w !gpg --armor --clearsign<CR>
nnoremap <Leader>s :w !gpg --armor --clearsign<CR>
xnoremap <Leader>ge <esc>:'<,'>:w !gpg --encrypt --sign --armor --output -<CR>
nnoremap <Leader>ge :w !gpg --encrypt --sign --armor --output -<CR>

iabbrev teh the

" php
au FileType php nmap <Leader>t :!(clear && phpunit --stop-on-failure %)<cr>
au FileType php nmap <Leader>l :!(php -l %)<cr>
au FileType php nmap <Leader>r :!php --rf <cword><cr>
au FileType php set omnifunc=phpcomplete_extended#CompletePHP
au FileType php let g:PHP_vintage_case_default_indent = 1
let g:deoplete#omni#input_patterns.php = '\w+|[^. \t]->\w*|\w+::\w*'
" defaults to composer.phar
let g:phpcomplete_index_composer_command = 'composer'
let g:syntastic_phpcs_disable = 1
let g:syntastic_php_checkers=['php']
function! PhpSyntaxOverride()
  " See https://github.com/StanAngeloff/php.vim/blob/master/syntax/php.vim#L781
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
  hi! def link phpDocIdentifier phpIdentifier
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

" clojure
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
au FileType clojure nmap <Leader>t :Eval<cr>cqp (run-tests)<cr>
au FileType clojure nmap <Leader>l :!(clear && lein check)<cr>
au FileType clojure nmap <Leader>r K<cr>

" rust
let g:rustfmt_autosave = 1
au FileType rust nmap <leader>t :!cargo test<cr>
au FileType rust nmap <leader>c :!RUST_BACKTRACE=1 cargo run<cr>

" js
let g:syntastic_javascript_checkers=[]
"let g:syntastic_javascript_checkers=['jslint']

" markdown
au FileType markdown setlocal spell
