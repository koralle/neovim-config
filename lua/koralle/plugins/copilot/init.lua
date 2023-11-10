---@type LazySpec
local spec = {
  {
    "github/copilot.vim",
    lazy = false,
    enabled = function()
      if vim.fn.executable("node") == 1 then
        return true
      else
        return false
      end
    end,
  },
}

return spec
