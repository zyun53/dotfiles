local config = function()
  vim.opt.termguicolors = true
  vim.cmd([[
      colorscheme nightfox
      ]])
end

local nightfox = {
  'EdenEast/nightfox.nvim',
  lazy = false,
  config = config,
}

return nightfox
