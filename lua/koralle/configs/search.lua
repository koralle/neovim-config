vim.opt.inccommand = "split"
vim.opt.incsearch = true
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading"
end
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<cr><C-l>")
