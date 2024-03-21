return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
		{ "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 1 } },
	},
	build = ":TSUpdate",
	config = function()
		local opts = { noremap = true, silent = true }

		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},
			ensure_installed = {
				"bash",
				"c",
				"css",
				"gitcommit",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"svelte",
				"tsx",
				"typescript",
				"vimdoc",
			},
			highlight = { enable = false },
			indent = { enable = true },
		})

		opts.desc = "Go to context."
		vim.keymap.set("n", "<leader>gc", "<cmd>lua require('treesitter-context').go_to_context()<cr>", opts)

		opts.desc = "Toggle InspectTree."
		vim.keymap.set("n", "<leader>tp", "<cmd>InspectTree<cr>", opts)
	end,
}
