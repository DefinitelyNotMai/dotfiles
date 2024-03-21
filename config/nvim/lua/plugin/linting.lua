return {
	"mfussenegger/nvim-lint",
	ft = {
		"go",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
	config = function()
		require("lint").linters_by_ft = {
			go = { "golangci-lint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("linting"),
			callback = function()
				require("lint").try_lint()
			end,
			pattern = {
				"go",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
			},
			desc = "Run linter.",
		})
	end,
}
