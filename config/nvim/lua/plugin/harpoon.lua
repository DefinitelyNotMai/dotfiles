local M = {}

M.plugin = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Mark file with harpoon.",
			noremap = true,
			silent = true,
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), {
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				})
			end,
			desc = "Mark file with harpoon.",
			noremap = true,
			silent = true,
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Switch to harpoon mark 1.",
			noremap = true,
			silent = true,
		},
		{
			"<C-j>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Switch to harpoon mark 2.",
			noremap = true,
			silent = true,
		},
		{
			"<C-k>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Switch to harpoon mark 3.",
			noremap = true,
			silent = true,
		},
		{
			"<C-l>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Switch to harpoon mark 4.",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end,
}

return M.plugin
