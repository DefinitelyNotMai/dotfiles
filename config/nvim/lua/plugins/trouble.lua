return {
	"folke/trouble.nvim",
	keys = {
		{
			"<LEADER>tt",
			function()
				require("trouble").toggle("diagnostics")
			end,
			desc = "Open Trouble diagnostics",
		},
	},
	config = function()
		require("trouble").setup({})
	end,
}
