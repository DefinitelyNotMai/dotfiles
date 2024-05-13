local M = {}

M.plugin = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		styles = {
			comments = {},
			conditionals = {},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}

return M.plugin
