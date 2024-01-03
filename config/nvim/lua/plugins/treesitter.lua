return {
  {
    'nvim-treesitter/nvim-treesitter',
    init = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'lua',
        highlight = {
          enable = true,
          disable = {},
        }
      })
    end,
  },
  --'nvim-treesitter/nvim-treesitter-context',
}
