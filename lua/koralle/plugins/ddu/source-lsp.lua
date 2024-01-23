---@type LazySpec
local spec = {
  "uga-rosa/ddu-source-lsp",
  dependnecies = {
    "ddu.vim",
  },
  init = function()
    vim.keymap.set("n", "gr", function()
      vim.fn["ddu#start"]({
        name = "lsp:references",
      })
    end)

    vim.keymap.set({ "n", "x" }, "<space>a", function()
      vim.fn["ddu#start"]({
        name = "lsp:code_action",
      })
    end)

    vim.keymap.set("n", "<space>db", function()
      vim.fn["ddu#start"]({
        name = "lsp:document_symbol",
      })
    end)

    vim.g.ddu_source_lsp_clientName = "nvim-lsp"
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_global({
      kindOptions = {
        lsp = {
          defaultAction = "open",
        },
        lsp_codeAction = {
          defaultAction = "apply",
        },
      },
    })

    helpers.patch_local("lsp:diagnostic", {
      sourceOptions = {
        _ = {
          converters = {
            "converter_lsp_diagnostic",
          },
        },
      },
    })

    helpers.patch_local("lsp:references", {
      sources = {
        "lsp_references",
      },
      sourceOptions = {
        ["lsp_references"] = {
          matchers = {
            "matcher_substring",
            "matcher_fzf",
          },
        },
      },
      filterParams = {
        ["matcher_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })

    helpers.patch_local("lsp:code_action", {
      sources = {
        "lsp_codeAction",
      },
    })

    helpers.patch_local("lsp:document_symbol", {
      sources = {
        {
          name = "lsp_documentSymbol",
        },
      },
      sourceOptions = {
        ["lsp_documentSymbol"] = {
          matchers = {
            "matcher_substring",
            "matcher_fzf",
          },
          converters = {
            "converter_lsp_symbol",
          },
        },
      },
      filterParams = {
        ["matcher_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })
  end,
}

return spec
