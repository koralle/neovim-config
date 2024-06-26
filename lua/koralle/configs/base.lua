vim.o.hidden = true
vim.opt.clipboard = "unnamedplus,unnamed"
vim.wo.cursorcolumn = true
vim.wo.cursorline = true
vim.bo.tabstop = 2
vim.o.list = true
vim.o.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:_"
vim.cmd([[set mouse=a]])
vim.o.number = true

-- Integrate fish
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Status Line
vim.o.laststatus = 3

vim.o.cmdheight = 0
