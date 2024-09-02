return {
  {
    'nvim-treesitter/nvim-treesitter',
    init = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = true,
        }
      })
    end,
  },
  --'nvim-treesitter/nvim-treesitter-context',
}
