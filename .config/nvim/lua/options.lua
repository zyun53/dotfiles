-- オプション
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.ambiwidth = 'double'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.clipboard:append({'unnamedplus'})
vim.opt.syntax = 'on'
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.virtualedit = 'onemore'
vim.opt.filetype = "plugin", "indent","on"
vim.opt.so = 5
vim.opt.cursorline = true
vim.opt.hidden = true

vim.opt.number = true
vim.opt.list = true
vim.opt.smartindent = true
vim.opt.visualbell = true

vim.opt.showmatch = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.listchars = 'tab:>-', 'trail:*', 'nbsp:+'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
vim.opt.backspace = 'start', 'eol', 'indent'

vim.opt.updatetime = 100
