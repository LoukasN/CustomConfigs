return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			hide_numbers = true,
			start_in_insert = false,
			insert_mappings = false,
			terminal_mappings = false,
			float_opts = {
				border = "curved",
				title_pos = "center",
			},
		})
	end,
	vim.keymap.set(
		"n",
		"<leader>v",
		"<cmd>ToggleTerm direction=horizontal name=Terminal<cr>",
		{ desc = "Open vertical terminal" }
	),
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]]),
}
