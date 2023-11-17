local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {desc = "Grep in files live"})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
