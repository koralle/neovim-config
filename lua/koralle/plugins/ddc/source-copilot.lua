---@type LazySpec
local spec = {
  {
    "Shougo/ddc-source-copilot",
    name = "ddc-source-copilot",
    dependencies = {
      "github/copilot.vim",
    },
    config = function()
      local helpers = require("koralle.helpers.ddc")

      helpers.patch_global({
        sourceOptions = {
          copilot = {
            mark = "[COPILOT]",
            matchers = {},
            minAutoCompleteLength = 0,
            isVolatile = true,
          },
        },
      })
    end,
  },
  {
    "github/copilot.vim",
    lazy = true,
    enabled = function()
      if vim.fn.executable("node") == 1 then
        return true
      else
        return false
      end
    end,
    config = function()
      vim.g.copilot_no_maps = true
      vim.g.copilot_filetypes = {
        text = true,
      }
    end,
  },
}

return spec
