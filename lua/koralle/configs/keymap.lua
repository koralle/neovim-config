vim.keymap.set("n", "<M-j>", "<Cmd>move .+1<CR>==")
vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("n", "<M-k>", "<Cmd>move .-2<CR>==")
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv=gv")
