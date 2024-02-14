---@type LazySpec
local spec = {
  "uga-rosa/ddc-source-nvim-lua",
  dependencies = {
    "ddc.vim",
  },
  config = function()
    local helpers = require("koralle.helpers.ddc")

    helpers.patch_filetype("lua", {
      sourceOptions = {
        ["nvim-lua"] = {
          mark = "[Lua]",
          dup = true,
          forceCompletionPattern = "\\.",
        },
      },
    })
  end,
}

return spec
