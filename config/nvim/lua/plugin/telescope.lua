return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},
	keys = {
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "Find buffers.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fd",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Find diagnostics.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Live grep.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fk",
			"<cmd>Telescope keymaps<cr>",
			desc = "Find keymaps.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>u",
			"<cmd>Telescope undo<cr>",
			desc = "Open undo history.",
			noremap = true,
			silent = true,
		},
	},
}
