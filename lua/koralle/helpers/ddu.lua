local M = {}

M.patch_global = vim.fn["ddu#custom#patch_global"]
M.patch_filetype = vim.fn["ddu#custom#patch_filetype"]
M.patch_local = vim.fn["ddu#custom#patch_local"]

return M
