return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			modules = {},
			ensure_installed = { "lua", "c", "bash", "markdown" },
			sync_install = true,
			ignore_install = {},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		})
	end,
}
