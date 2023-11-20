-- header key
vim.g.mapleader = " "
--open file search
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "File search"})
--"builtin.find_files", {})Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--Terminal
vim.keymap.set("n", "<F5>", "<cmd>terminal<CR>A")
vim.keymap.set("t", "<F5>", "<C-d><CR>")
