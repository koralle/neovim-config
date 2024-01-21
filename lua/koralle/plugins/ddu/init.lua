---@type LazySpec
local spec = {
  {
    "Shougo/ddu.vim",
    name = "ddu.vim",
    import = "koralle.plugins.ddu",
    dependencies = {
      "denops.vim",
    },
  },
}

return spec
