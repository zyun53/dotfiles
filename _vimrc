if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('altercation/vim-colors-solarized')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set fileencodings=utf-8,cp932

set iminsert=0
set imsearch=-1

set number

syntax enable
set background=dark
colorscheme solarized

set tabstop=4
set shiftwidth=4
set expandtab

set autochdir

set directory=~/.cache/vim/swapfile
set backupdir=~/.cache/vim/backup
set undodir=~/.cache/vim/undo

" markdown preview
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

" denite
nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
nmap <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
nmap <silent> <C-u><C-j> :<C-u>Denite line<CR>
nmap <silent> <C-u><C-g> :<C-u>Denite grep<CR>
nmap <silent> <C-u><C-]> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-u> :<C-u>Denite file_mru<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>
nmap <silent> <C-u>; :<C-u>Denite -resume -immediately -select=+1<CR>
nmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>
nmap <silent> <C-u><C-d> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
nnoremap ml :<C-u>call denite#start([{'name': 'file_rec', 'args': [g:memolist_path]}])<CR>
