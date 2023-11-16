---@type LazySpec
local spec = {
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
