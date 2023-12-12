--- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--- Setup plugins
require('lazy').setup {
  {'keaising/im-select.nvim',
    config = function()
      require("im_select").setup({})
    end,
  },
  {'lewis6991/gitsigns.nvim',
    config = function()
      require('settings/gitsigns')
    end
  },
  {"EdenEast/nightfox.nvim" },
  {'preservim/nerdtree'},
  {'ctrlpvim/ctrlp.vim'},
  {'akinsho/toggleterm.nvim'},
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- cmp
  {"hrsh7th/nvim-cmp" },
  {"hrsh7th/cmp-nvim-lsp" },
  {"hrsh7th/vim-vsnip" },
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-cmdline"},
  {
    'nvim-treesitter/nvim-treesitter',
    init = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = {
          enable = true,
        }
      })
    end,
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
