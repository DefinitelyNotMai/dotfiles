return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- add snippets for js, jsx, ts, and tsx files
		luasnip.filetype_extend("javascript", { "jsdoc" })
		luasnip.filetype_extend("javascriptreact", { "html", "jsdoc", "react-es7" })
		luasnip.filetype_extend("typescript", { "tsdoc" })
		luasnip.filetype_extend("typescriptreact", { "html", "tsdoc", "react-ts" })
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, vim_item)
					vim_item.menu = ({
						buffer = "[BUF]",
						luasnip = "[SNIP]",
						nvim_lsp = "[LSP]",
						path = "[PATH]",
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			window = {
				completion = { border = "none" },
				documentation = { border = "none" },
			},
		})
	end,
}
