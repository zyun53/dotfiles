return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.rust_analyzer.setup {}
    lspconfig.pyright.setup {}
    lspconfig.tsserver.setup {}
  end
}
