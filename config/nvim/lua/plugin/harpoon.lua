return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<leader>a",
			"<cmd>lua require('harpoon'):list():append()<cr>",
			desc = "Mark file with harpoon.",
			noremap = true,
			silent = true,
		},
		{
			"<C-e>",
			"<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), { border = 'none', title_pos = 'center' } )<cr>",
			desc = "Open harpoon window.",
			noremap = true,
			silent = true,
		},
		{
			"<C-h>",
			"<cmd>lua require('harpoon'):list():select(1)<cr>",
			desc = "Switch to harpoon mark 1.",
			noremap = true,
			silent = true,
		},
		{
			"<C-j>",
			"<cmd>lua require('harpoon'):list():select(2)<cr>",
			desc = "Switch to harpoon mark 2.",
			noremap = true,
			silent = true,
		},
		{
			"<C-k>",
			"<cmd>lua require('harpoon'):list():select(3)<cr>",
			desc = "Switch to harpoon mark 3.",
			noremap = true,
			silent = true,
		},
		{
			"<C-l>",
			"<cmd>lua require('harpoon'):list():select(4)<cr>",
			desc = "Switch to harpoon mark 4.",
			noremap = true,
			silent = true,
		},
	},
}
