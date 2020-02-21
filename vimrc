" vim: foldmethod=marker
"
" Special thanks!!
" https://github.com/statico/dotfiles/blob/master/.vim/vimrc
" https://github.com/mopp/dotfiles/blob/master/.vimrc

set nocompatible

" Mappings {{{

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

" Set <Leader> and <LocalLeader>.
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
" }}}

" Encoding {{{
if has('vim_starting')
    " Changing encoding in Vim at runtime is undefined behavior.
    set encoding=utf-8
    set fileencodings=utf-8,sjis,cp932,euc-jp
    set fileformats=unix,mac,dos
endif

" This command has to be after `set encoding`.
scriptencoding utf-8
" }}}

" Plug {{{
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

" color
Plug 'altercation/vim-colors-solarized'

" Utils
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'rhysd/accelerated-jk'

Plug 'editorconfig/editorconfig-vim'

" Languages
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'hail2u/vim-css3-syntax'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'vim-jp/cpp-vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/sh.vim--Cla'

" Completions 
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

filetype plugin indent on
" }}}

" lsp-settings {{{
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_conceal_code_blocks = 0
" }}}

" fzf {{{
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Rg!<CR>
nmap <Leader>c :Colors<CR>
" }}}

" nerdtree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}

" accelerated-jk {{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
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

syntax enable
colorscheme solarized
set background=dark
