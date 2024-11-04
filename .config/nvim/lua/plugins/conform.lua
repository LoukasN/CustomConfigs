return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				css = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				sql = { "sqlfmt" },
				hdl = { "vhdl_ls" },
				typ = { "typstfmt" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	timeout_ms = 500,
			-- },
		})
		require("conform").formatters.clang = function(bufnr)
			return {
				command = require("conform.util").find_executable({
					"usr/bin/clang",
				}, "clang"),
			}
		end
	end,
}
