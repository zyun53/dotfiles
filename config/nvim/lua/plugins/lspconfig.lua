return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
      local lspconfig = require('lspconfig')
      lspconfig.rust_analyzer.setup {}
  end
}
