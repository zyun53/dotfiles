"vim-plug -----------------------------
if has('vim_starting')
  set nocompatible
endif

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
Plug 'joonty/vdebug'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/linediff.vim'

Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
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

" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-typescript'

" Initialize plugin system
call plug#end()
"End vim-plug -------------------------

" ----------------------------------------------------------------------------
" OPTIONS
" ----------------------------------------------------------------------------

set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=                   " See :h cinoptions-values
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set list                    " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
set number                " No line numbers to start
set visualbell t_vb=        " No flashing or beeping at all
set nowritebackup           " No backups made while editing
set printoptions=paper:letter " US paper
set ruler                   " Show row/col and percentage
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set sessionoptions-=options " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=2            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=2           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=2               " The One True Tab
set textwidth=100           " 100 is the new 80
set thesaurus+=~/.vim/mthes10/mthesaur.txt
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion

" ----------------------------------------------------------------------------
" Configurations
" ----------------------------------------------------------------------------

let mapleader = "\<Space>"

nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

nmap j gj
nmap k gk

set background=dark
colorscheme solarized

" ----------------------------------------------------------------------------
" Plugin
" ----------------------------------------------------------------------------

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


"" youcompleteme
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_seed_identifiers_with_syntax = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

"""
""" phpactor
"""
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
autocmd FileType php setlocal omnifunc=phpactor#Complete



" typescript language server
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif
