return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup({ max_lines = 1 })
			end,
		},
	},
	build = ":TSUpdate",
	keys = {
		{
			"<leader>gc",
			function()
				require("treesitter-context").go_to_context()
			end,
			desc = "Go to context.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>tp",
			function()
				vim.treesitter.inspect_tree()
			end,
			desc = "Toggle InspectTree.",
			noremap = true,
			silent = true,
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = { enable = true },
			ensure_installed = {
				"angular",
				"astro",
				"bash",
				"c",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"svelte",
				"tsx",
				"typescript",
				"vimdoc",
			},
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-Space>",
					node_incremental = "<C-Space>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
		})
	end,
}
