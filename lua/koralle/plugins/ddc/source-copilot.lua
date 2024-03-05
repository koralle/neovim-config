local global_dependencies = require("koralle.helpers.ddc").global_dependencies

local dependencies = {}
for i, v in ipairs(global_dependencies) do
  dependencies[i] = v
end

dependencies[#dependencies + 1] = "copilot.vim"

---@type LazySpec
local spec = {
  {
    "Shougo/ddc-source-copilot",
    name = "ddc-source-copilot",
    dependencies = dependencies,
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
    name = "copilot.vim",
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
