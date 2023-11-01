---@type LazySpec
local spec = {
  "vim-denops/denops.vim",
  enabled = function()
    if vim.fn.executable("deno") == 1 then
      return true
    else
      return false
    end
  end,
}

return spec
