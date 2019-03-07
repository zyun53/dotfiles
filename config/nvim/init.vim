" dein settings {{{
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml('~/.vim/rc/dein.toml',          {'lazy': 0})
    call dein#load_toml('~/.vim/rc/dein_lazy.toml',     {'lazy': 1})
    call dein#load_toml('~/.vim/rc/dein_neo.toml',      {'lazy': 1})
    "call dein#load_toml('~/.vim/rc/dein_python.toml',   {'lazy': 1})
    "call dein#load_toml('~/.vim/rc/dein_go.toml',       {'lazy': 1})
    "call dein#load_toml('~/.vim/rc/dein_frontend.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" }}}

filetype plugin indent on
syntax enable

" 検索に大文字小文字を無視
set ignorecase
set smartcase

set number

set expandtab
set tabstop=4
set shiftwidth=4

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

au BufNewFile,BufRead *.php set tags+=$HOME/php.tags  

" 文字の可視化
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" status line ------------------------------------------------------------------
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" 現在行数/全行数
set statusline+=:%l/%L

let &statusline = ''
let &statusline .= '%<%f %h%m%r%w'
let &statusline .= '%='
let &statusline .= '['
let &statusline .=   '%{&l:fileencoding == "" ? &encoding : &l:fileencoding}'
let &statusline .=   '%{&l:bomb ? "/BOM" : ""}'
let &statusline .= ']'
let &statusline .= '[%{&l:fileformat}]'
let &statusline .= '  %-8.(%l,%c%V%) %P'

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

" Vimfiler
let g:vimfiler_as_default_explorer = 1

" For markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

