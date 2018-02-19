
" https://github.com/junegunn/vim-plug
" PlugInstall PlugUpdate
call plug#begin()

Plug 'sjl/badwolf'
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
Plug 'vim-scripts/yaifa.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'SirVer/UltiSnips' | Plug 'honza/vim-snippets'
Plug 'int3/vim-extradite'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'vimwiki/vimwiki'
Plug 'fntlnz/atags.vim'
Plug 'godlygeek/tabular'
"Plug 'joonty/vdebug.git'

" == languages ==
"Plug 'm2mdas/phpcomplete-extended', { 'for': 'php' }
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
" update to syntax file
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'm2mdas/phpcomplete-extended-laravel', { 'for': 'php' }
"Plug 'm2mdas/phpcomplete-extended-symfony', { 'for': 'php' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
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

" Move line up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Shift in insert mode
vnoremap > >gv
vnoremap < <gv

imap <C-l> <C-t>
imap <C-h> <C-d>

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
nnoremap <Leader>m :mode<cr>
xnoremap <Leader>s <esc>:'<,'>:w !gpg --armor --clearsign<CR>
nnoremap <Leader>s :w !gpg --armor --clearsign<CR>
xnoremap <Leader>ge <esc>:'<,'>:w !gpg --encrypt --sign --armor --output -<CR>
nnoremap <Leader>ge :w !gpg --encrypt --sign --armor --output -<CR>

iabbrev teh the

" php
function! PHPUnitTestFile()
    let l:filename = expand('%')
    if l:filename !~# 'Test\.php$'
        let l:filename = substitute(l:filename, '\.php$', 'Test.php', '')
    endif
    return substitute(l:filename, 'src', 'tests', '')
endfunction
function! RunPhpUnit()
    return ':!vendor/bin/phpunit --stop-on-failure ' . PHPUnitTestFile() . "\<CR>"
endfunction
function! JumpToPHPUnittest()
    return ':e ' . PHPUnitTestFile() . "\<CR>"
endfunction
"au FileType php nmap <Leader>t :!(clear && phpunit --stop-on-failure %)<cr>
au FileType php nmap <expr> <leader>t RunPhpUnit()
au FileType php nmap <expr> <leader>j JumpToPHPUnittest()
au FileType php nmap <Leader>l :!(php -l %)<cr>
au FileType php nmap <Leader>r :!php --rf <cword><cr>
"au FileType php set omnifunc=phpcomplete_extended#CompletePHP
au FileType php set omnifunc=
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
au FileType php let g:atags_build_commands_list = [
    \ 'ag --php -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm -f tags.tmp'
    \ ]
augroup phpGenTags
  autocmd!
  autocmd FileType php au BufWritePost * call atags#generate()
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
au FileType rust set makeprg=cargo\ build\ -j\ 4
au FileType rust nmap <leader>t :!cargo test<cr>
au FileType rust nmap <leader>r :!RUST_BACKTRACE=1 cargo run<cr>
au FileType rust nmap <leader>c :term cargo build -j 4<cr>
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" js
let g:syntastic_javascript_checkers=[]
"let g:syntastic_javascript_checkers=['jslint']

" markdown
au FileType markdown setlocal spell

" yaml
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab

"let g:vimwiki_list = [{'path': '~/.vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

