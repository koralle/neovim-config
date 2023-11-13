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
