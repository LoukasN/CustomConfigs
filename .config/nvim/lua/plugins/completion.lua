return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-e>"] = cmp.mapping.abort(),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	vim.keymap.set({ "i", "s" }, "<c-k>", function()
		if require("luasnip").expand_or_jumpable() then
			require("luasnip").expand_or_jump()
		end
	end, { silent = true }),

	vim.keymap.set({ "i", "s" }, "<c-j>", function()
		if require("luasnip").jumpable(-1) then
			require("luasnip").jump(-1)
		end
	end, { silent = true }),
}
