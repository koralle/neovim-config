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
  {
    "Shougo/ddu-source-action",
    name = "ddu-source-action",
    dependencies = {
      "ddu.vim",
    },
    config = function()
      local helpers = require("koralle.helpers.ddu")

      helpers.patch_global({
        kindOptions = {
          action = {
            defaultAction = "do",
          },
        },
      })
    end,
  },
}

return spec
