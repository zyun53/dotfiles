vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require 'options'

vim.cmd("colorscheme nightfox")

-- dpp.vim
local cache = vim.fn.expand('~/.cache/dpp/')

if vim.fn.isdirectory(cache) == 0 then
  vim.fn.mkdir(cache, 'p')
end

local dpp_src = cache .. "repos/github.com/Shougo/dpp.vim"
local denops_src = '~/.cache/dpp/repos/github.com/denops/denops.vim'

vim.opt.rtp:prepend(dpp_src)

if vim.fn['dpp#min#load_state'] == 0 then
  print('ok')
  else
  print('error')
end
