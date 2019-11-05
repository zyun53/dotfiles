" vim: foldmethod=marker

set nocompatible

" Encoding. {{{
if has('vim_starting')
    " Changing encoding in Vim at runtime is undefined behavior.
    set encoding=utf-8
    set fileencodings=utf-8,sjis,cp932,euc-jp
    set fileformats=unix,mac,dos
endif

" This command has to be after `set encoding`.
scriptencoding utf-8
" }}}

" Plugins. {{{

if !filereadable(expand('~/.vim/autoload/plug.vim'))
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-github-dashboard'

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'joonty/vdebug'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/linediff.vim'

Plug 'rhysd/accelerated-jk'

Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
" html
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'

Plug 'jelera/vim-javascript-syntax'
Plug 'arnaud-lb/vim-php-namespace'

Plug 'Shougo/vimshell.vim'

" php
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" sql
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-neosnippet'

Plug 'ryanolsonx/vim-lsp-typescript'

" Initialize plugin system
call plug#end()

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ }

augroup vimrc-filetype
  autocmd!
  " PHPだったらインデント幅が4で
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd BufNewFile,BufRead *.php set tags+=$HOME/.php.tags
  autocmd BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/.php.tags `pwd` 2>/dev/null &"
  autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' 2>/dev/null &

  " Rubyだったらインデント幅は2にしたい
  autocmd BufNewFile,BufRead *.rb set filetype=ruby
  autocmd BufNewFile,BufRead *.ruby set filetype=ruby
  autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2


  au BufRead,BufNewFile *.template.yml set ft=cloudformation.yaml
augroup END


" 複数タグが見つかった場合
nnoremap <C-]> g<C-]>

" flake8をLinterとして登録
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'php': ['phpcs'],
  \ }

let g:ale_fixers = {
  \ 'python': ['autopep8', 'black', 'isort'],
  \ }


" phpcs -i　で返ってきた値を使えます。
let g:ale_php_phpcs_standard = 'PSR2'
" グローバルで設定する
let g:ale_php_phpcs_use_global = 1

let g:vdebug_force_ascii = 1

"" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <Leader>dir :NERDTreeTabsToggle<CR>
" autocmd BufWritePre * :FixWhitespace

"" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END


" phpactor {{{
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
" nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete " }}}

" typescript language server {{{
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif " }}}

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" }}}

" Indent. {{{
set autoindent
set backspace=2
"set backspace=indent,eol,start
set breakindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4
" }}}

" Search. {{{
set hlsearch
set ignorecase
set incsearch
set smartcase
" }}}

" History {{{
set history=2048
set undodir=~/.vim/undo
set undofile
set viewoptions=cursor,folds
" }}}

" Appearance. {{{
set ambiwidth=double
set cmdheight=2
set conceallevel=2
set cursorline
set display=lastline
set laststatus=2
set list
set listchars=tab:>\ ,trail:\ ,extends:<,precedes:<,nbsp:%
set noarabicshape
set nowrap
set number
set scrolloff=3
set showcmd
set showmatch
set showtabline=2
set signcolumn=yes
set statusline=%<%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}%=%l/%L,%c%V%8P
set synmaxcol=512
" }}}

" Folding. {{{
set foldenable
set foldcolumn=1
set foldmethod=indent
set foldtext=Mopp_fold_text()
" }}}

" Safety. {{{
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set swapfile
set writebackup
" }}}

" Functions {{{
function! Mopp_fold_text() abort " {{{
    let l:head = getline(v:foldstart)
    if &foldmethod !=# 'marker'
        let l:head = '+' . repeat('-', &shiftwidth * v:foldlevel - 2) . ' ' . substitute(l:head, '^\s*', '', '')
    endif

    let l:tail = printf('[ %2d Lines Lv%02d ]', (v:foldend - v:foldstart + 1), v:foldlevel)
    let l:count_columns = &foldcolumn + (&number ? max([&numberwidth, strdisplaywidth(line('$'))]) : 0) + (&signcolumn ==# 'no' ? 0 : 2)
    let l:spaces = repeat(' ', winwidth(0) - l:count_columns - strdisplaywidth(l:head) - strdisplaywidth(l:tail)- 1)
    return l:head . l:spaces . l:tail
endfunction " }}}
" }}}

" Mappings. {{{

"---------------------------------------------------------------------------"
" Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator |
"------------------|--------|--------|---------|--------|--------|----------|
" map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |
" nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |
" vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |
" omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |
" xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |
" smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |
" map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |
" imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |
" cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |
"---------------------------------------------------------------------------"
let mapleader = "\<Space>"

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>
" }}}

syntax enable
colorscheme solarized
set background=dark
