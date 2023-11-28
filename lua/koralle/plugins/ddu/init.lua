---@type LazySpec
local spec = {
  {
    "Shougo/ddu.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddu-ui-filer",
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-source-file_rec",
      "Shougo/ddu-filter-matcher_substring",
      "Shougo/ddu-source-file",
      "Shougo/ddu-kind-file",
      "Shougo/ddu-column-filename",
      "uga-rosa/ddu-filter-converter_devicon",
    },
    config = function()
      vim.fn["ddu#custom#patch_local"]("filer", {
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
            converters = {
              "converter_devicon",
            },
          },
        },
        kindOptions = {
          file = {
            defaultAction = "open",
          },
        },
      })

      local lines = vim.opt.lines:get()
      local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
      local columns = vim.opt.columns:get()
      local width, col = math.floor(columns * 0.8), math.floor(columns * 0.1)

      vim.fn["ddu#custom#patch_local"]("ff", {
        ui = "ff",
        uiParams = {
          ff = {
            split = "floating",
            startFilter = true,
            prompt = "> ",
            winHeight = height,
            winRow = row,
            winWidth = width,
            winCol = col,
            floatingBorder = "single",
            filterFloatingPosition = "top",
            autoAction = {
              name = "preview",
            },
          },
        },
        sources = {
          {
            name = "file_rec",
            params = {},
          },
        },
        sourceOptions = {
          _ = {
            matchers = {
              "matcher_substring",
            },
            converters = {
              "converter_devicon",
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

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "ddu-ff" },
        callback = function()
          vim.keymap.set("n", "<cr>", function()
            vim.fn["ddu#ui#filer#do_action"]("itemAction")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "<space>", function()
            vim.fn["ddu#ui#filer#do_action"]("toggleSelectItem")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "i", function()
            vim.fn["ddu#ui#filer#do_action"]("openFilterWindow")
          end, { noremap = true, buffer = true })

          vim.keymap.set("n", "q", function()
            vim.fn["ddu#ui#filer#do_action"]("quit")
          end, { noremap = true, buffer = true, silent = true })
        end,
      })

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "ddu-ff-filter" },
        callback = function()
          vim.keymap.set(
            "i",
            "<cr>",
            "<esc><cmd>close<cr>",
            { noremap = true, buffer = true, silent = true }
          )

          vim.keymap.set(
            "n",
            "<cr>",
            "<esc><cmd>close<cr>",
            { noremap = true, buffer = true, silent = true }
          )

          vim.keymap.set(
            "n",
            "q",
            "<esc><cmd>close<cr>",
            { noremap = true, buffer = true, silent = true }
          )
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
  {
    "Shougo/ddu-filter-matcher_substring",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "uga-rosa/ddu-filter-converter_devicon",
    lazy = true,
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
}

return spec
