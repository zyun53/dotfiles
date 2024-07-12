return {
  {
    "Shougo/ddc.vim",
    "Shougo/pum.vim",
    "Shougo/ddc-ui-pum",
  config = function()
    local patch_global = fn["ddc#custom#patch_global"]

    patch_global("ui", "pum")

    patch_global("autoCompleteEvents", {
      "InsertEnter",
      "TextChangedI",
      "TextChangedP",
      "CmdlineChanged",
    })

    patch_global("sources", {
      "skkeleton",
      "lsp",
      "vsnip",
      "file",
      "around",
    })

    patch_global("cmdlineSources", {
      [":"] = {
        "cmdline",
        "around",
      },
      ["/"] = {
        "around",
      },
      ["?"] = {
        "around",
      },
    })

    patch_global("sourceOptions", {
      _ = {
        matchers = { "matcher_fuzzy" },
        sorters = { "sorter_fuzzy" },
        converters = { "converter_fuzzy", "converter_remove_overlap" },
        minAutoCompleteLength = 1,
        ignoreCase = true,
      },
      around = {
        mark = "[A]",
      },
      lsp = {
        mark = "[L]",
        dup = "keep",
        keywordPattern = "[a-zA-Z0-9_À-ÿ$#\\-*]*",
        forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
        sorters = { "sorter_lsp-kind", "sorter_fuzzy" },
      },
      file = {
        mark = "[F]",
        isVolatile = true,
        forceCompletionPattern = [[\S/\S*]],
      },
      skkeleton = {
        mark = "[SKK]",
        matchers = { "skkeleton" },
        sorters = {},
        converters = {},
        isVolatile = true,
        minAutoCompleteLength = 2,
      },
      cmdline = {
        mark = "[C]",
      },
    })

    patch_global("filterParams", {
      matcher_fuzzy = {
        splitMode = "word",
      },
    })

    patch_global("sourceParams", {
      lsp = {
        snippetEngine = vim.fn["denops#callback#register"](function(body)
          vim.fn["vsnip#anonymous"](body)
        end),
        enableResolveItem = true,
        enableAdditionalTextEdit = true,
        confirmBehavior = "replace",
      },
    })

    for _, mode in pairs({ "n", "i", "x" }) do
      h[mode .. "map"](":", "<Cmd>call ddc#enable_cmdline_completion()<CR>:", { noremap = true })
      h[mode .. "map"]("/", "<Cmd>call ddc#enable_cmdline_completion()<CR>/", { noremap = true })
      h[mode .. "map"]("?", "<Cmd>call ddc#enable_cmdline_completion()<CR>?", { noremap = true })
    end

    fn["ddc#enable"]()
  end,
},
}
