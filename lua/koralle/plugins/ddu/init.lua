---@type LazySpec
local spec = {
  {
    "Shougo/ddu.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddu-ui-filer",
      "Shougo/ddu-source-file",
      "Shougo/ddu-kind-file",
      "Shougo/ddu-column-filename",
    },
    config = function()
      vim.fn["ddu#custom#patch_global"]({
        ui = "filer",
        uiParams = {
          filer = {
            split = "floating",
            winWidth = math.floor(vim.o.columns * 0.8),
            winHeight = math.floor(vim.o.columns * 0.6),
          },
        },
        sources = {
          {
            name = "file",
            params = {},
          },
        },
        sourceOptions = {
          _ = {
            columns = {
              "filename",
            },
          },
        },
        kindOptions = {
          file = {
            defaultAction = "open",
          },
        },
      })

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "ddu-filer" },
        callback = function()
          vim.keymap.set("n", "<cr>", function()
            vim.fn["ddu#ui#filer#do_action"]("itemAction")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "<space>", function()
            vim.fn["ddu#ui#filer#do_action"]("toggleSelectItem")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "l", function()
            vim.fn["ddu#ui#filer#do_action"]("expandItem", { mode = "toggle" })
          end, { noremap = true, buffer = true })

          vim.keymap.set("n", "q", function()
            vim.fn["ddu#ui#filer#do_action"]("quit")
          end, { noremap = true, buffer = true, silent = true })
        end,
      })
    end,
  },
  {
    "Shougo/ddu-source-file",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "Shougo/ddu-kind-file",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "Shougo/ddu-column-filename",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "Shougo/ddu-ui-filer",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "Shougo/ddu-ui-ff",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "Shougo/ddu-source-file_rec",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
}

return spec
