return {
	"tpope/vim-fugitive",
	keys = {
		{
			"<LEADER>gs",
			function()
				vim.cmd.Git()
			end,
			desc = "Open Fugitive.",
		},
	},
}
