return {
    'nvim-treesitter/nvim-treesitter',
    init = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = {
          enable = true,
        }
      })
    end,
  'nvim-treesitter/nvim-treesitter-context',
}
