return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			padding = true,
			toggler = {
				line = 'gcc',
				block = 'gbc',
			},
			opleader = {
				line = 'gc',
				block = 'gb',
			},
			mappings = {
				basic = true,
			},
		})
	end
}
