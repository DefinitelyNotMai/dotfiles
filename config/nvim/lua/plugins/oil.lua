return {
	"stevearc/oil.nvim",
	keys = {
		{
			"<LEADER>e",
			"<CMD>Oil<CR>",
			desc = "Open Oil or go to parent directory.",
			noremap = true,
			silent = true,
		},
	},
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
