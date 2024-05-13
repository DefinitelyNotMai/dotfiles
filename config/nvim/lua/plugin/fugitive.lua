local M = {}

M.plugin = {
	"tpope/vim-fugitive",
	keys = {
		{
			"<leader>gs",
			"<cmd>Git<cr>",
			desc = "Open Fugitive.",
			noremap = true,
			silent = true,
		},
	},
}

return M.plugin
