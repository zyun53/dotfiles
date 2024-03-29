return {  -- cmp
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
      }, {
        { name = 'buffer' },
      })
    })
    end,
  },
  -- LSP completion source:
  "hrsh7th/cmp-nvim-lsp",
  -- Useful completion sources:
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  --'hrsh7th/cmp-nvim-lua',
  --'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  "hrsh7th/vim-vsnip",
}
