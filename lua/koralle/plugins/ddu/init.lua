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
}

return spec
