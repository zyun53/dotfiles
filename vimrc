" vim: foldmethod=marker

" Plug {{{
call plug#begin()

Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'

Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'shun/ddc-vim-lsp'

Plug 'junegunn/vim-easy-align'

Plug 'wuelnerdotexe/vim-astro'

call plug#end()
" }}}

" ddc.vim {{{
call ddc#custom#patch_global('sources', ['vim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ 'vim-lsp': {'mark': 'LSP'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

call ddc#enable()
" }}}

syntax enable

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set swapfile
set writebackup

set autoindent
set backspace=2
set backspace=indent,eol,start
set breakindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

set hlsearch
set ignorecase
set incsearch
set smartcase

set ambiwidth=double
set cmdheight=2
set conceallevel=2
set cursorline
set display=lastline
set history=2048
set undodir=~/.vim/undo
set undofile
set viewoptions=cursor,folds

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
set synmaxcol=512
