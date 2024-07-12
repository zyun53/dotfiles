return {
  'vim-skk/skkeleton',
  dependencies = {
    "vim-denops/denops.vim",
  },
  config = function()
    vim.fn["skkeleton#config"]({
      globalDictionaries = {"~/.skk/SKK-JISYO.L.json"},
      eggLikeNewline = true,
      immediatelyCancel = true,
    })
    vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)')
    vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)')
    vim.keymap.set('t', '<C-j>', '<Plug>(skkeleton-enable)')
  end,
}
