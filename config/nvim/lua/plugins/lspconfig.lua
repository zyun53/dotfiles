return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.rust_analyzer.setup {}
    lspconfig.pyright.setup {}
    lspconfig.ts_ls.setup {}
    lspconfig.gopls.setup {}
  end
}
