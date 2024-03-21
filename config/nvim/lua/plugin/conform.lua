return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			go = { "goimports" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			svelte = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		format_on_save = { async = false },
	},
}
