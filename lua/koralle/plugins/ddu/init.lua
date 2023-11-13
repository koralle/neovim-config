---@type LazySpec
local spec = {
  {
    "Shougo/ddu.vim",
    dependencies = {
      "vim-denops/denops.vim",
    },
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
}

return spec
