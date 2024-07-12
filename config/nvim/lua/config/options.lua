-- オプション
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.ambiwidth = 'double'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.clipboard:append({'unnamedplus'})
--vim.opt.syntax = 'on'
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true
--vim.opt.virtualedit = 'onemore'
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

vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
vim.opt.backspace = 'start', 'eol', 'indent'

vim.opt.updatetime = 100


vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
