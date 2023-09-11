--leader key
vim.g.mapleader = " "
--open file search
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--"builtin.find_files", {})Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "C-j", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--Make a script executable
vim.keymap.set("n", "<leader>x", "<cmd>chmod +x %<CR>, { silent = true }")
--Open cheatsheet
vim.keymap.set("n", "<leader>h", "<cmd>Cheatsheet<CR>")
