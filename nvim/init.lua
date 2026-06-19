require("config.lazy")

-- +share clipboard with OS
vim.opt.clipboard:append('unnamedplus,unnamed')

-- use 2-spaces indent
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- scroll offset as 3 lines
vim.opt.scrolloff = 3

-- move the cursor to the previous/next line across the first/last character
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

vim.api.nvim_create_user_command(
    'InitLua',
    function()
        vim.cmd.edit(vim.fn.stdpath('config') .. '/init.lua')
    end,
    { desc = 'Open init.lua' }
)

-- augroup for this config file
local augroup = vim.api.nvim_create_augroup('init.lua', {})

-- wrapper function to use internal augroup
local function create_autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, vim.tbl_extend('force', {
    group = augroup,
  }, opts))
end

-- https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(event)
    local dir = vim.fs.dirname(event.file)
    local force = vim.v.cmdbang == 1
    if vim.fn.isdirectory(dir) == 0
        and (force or vim.fn.confirm('"' .. dir .. '" does not exist. Create?', "&Yes\n&No") == 1) then
      vim.fn.mkdir(vim.fn.iconv(dir, vim.opt.encoding:get(), vim.opt.termencoding:get()), 'p')
    end
  end,
  desc = 'Auto mkdir to save file'
})


-- ========================================================================== --
--                             基本表示・UI設定
-- ========================================================================== --
vim.opt.number = true         -- 行番号を表示
vim.opt.relativenumber = false -- 相対行番号（好みでtrueに）
vim.opt.title = true          -- 編集中のファイル名をタイトルバーに表示
vim.opt.cursorline = true     -- カーソル行をハイライト
vim.opt.termguicolors = true  -- TrueColor対応（モダンなカラースキームに必要）
vim.opt.mouse = 'a'           -- マウス操作を有効化
vim.opt.signcolumn = 'yes'    -- 画面左端にサイン列を常に表示（Gitや診断用）

-- ========================================================================== --
--                             検索・操作設定
-- ========================================================================== --
vim.opt.ignorecase = true     -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true      -- 大文字を含めて検索したら区別する
vim.opt.incsearch = true      -- インクリメンタルサーチ（入力中から検索）
vim.opt.hlsearch = true       -- 検索結果をハイライト（Esc連打などで消す設定は後述）

-- ========================================================================== --
--                             インデント・タブ設定
-- ========================================================================== --
vim.opt.smartindent = true    -- 改行時に自動でインデントを入れる

-- ========================================================================== --
--                             シンタックス・基本挙動
-- ========================================================================== --
--vim.cmd('syntax on')          -- シンタックスハイライトを有効化
--vim.opt.fileencoding = 'utf-8' -- エンコーディングをUTF-8に

-- ========================================================================== --
--                             キーマッピング
-- ========================================================================== --
-- Leaderキーをスペースに設定（拡張機能などで多用します）
vim.g.mapleader = " "

-- Esc2回で検索ハイライトを消す
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { silent = true })

-- インサートモードでも jj でノーマルモードに戻る（お好みで）
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

vim.cmd.colorscheme "catppuccin-nvim"

require('lualine').setup {
  options = {
    icons_enabled = false,
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.opt.list = true
vim.opt.listchars = {
  tab = '..',
  trail = '_',
  extends = '>',
  precedes = '<',
  nbsp = '~',
}

