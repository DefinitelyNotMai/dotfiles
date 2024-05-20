return {
	"mbbill/undotree",
	keys = {
		{
			"<LEADER>u",
			function()
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end,
			desc = "Open Undotree.",
			noremap = true,
			silent = true,
		},
	},
	config = function()
		vim.g.undotree_WindowLayout = 2
	end,
}
