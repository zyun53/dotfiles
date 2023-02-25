require "plugins"

local g = vim.g
local cmd = vim.cmd

-- options
local opt = vim.opt

opt.mouse = 'a'
opt.title = true
opt.ambiwidth = 'double'

opt.swapfile = false
opt.backup = false
opt.hidden = true
opt.clipboard:append({unnamedplus = true})

opt.syntax = 'on'
opt.incsearch = true
opt.hlsearch = true
opt.smartcase = true
opt.autoindent = true
opt.ruler = true
opt.laststatus = 2
opt.showcmd = true
opt.wildmenu = true
opt.virtualedit = 'onemore'
opt.filetype = "plugin", "indent","on"
opt.so = 5
opt.cursorline = true
opt.hidden = true

opt.number = true
opt.list = true
opt.smartindent = true
opt.visualbell = true

opt.showmatch = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.listchars = 'tab:>-', 'trail:*', 'nbsp:+'
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true

opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
opt.backspace = 'start', 'eol', 'indent'
opt.fileformats = 'dos', 'unix', 'mac'

opt.helplang = 'ja', 'en'

opt.updatetime = 300

opt.showtabline = 2

vim.cmd("colorscheme nightfox")

local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("mason").setup()
require("mason-lspconfig").setup()

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['marksman'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.markdownlint,
    },
})


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
