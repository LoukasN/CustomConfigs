-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
	},
}
