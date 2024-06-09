return {
	"lewis6991/gitsigns.nvim",
	event = { "BufNewFile", "BufReadPre" },
	keys = {
		{
			"<LEADER>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk.",
		},
		{
			"[g",
			function()
				require("gitsigns").prev_hunk()
			end,
			desc = "Go to previous hunk.",
		},
		{
			"]g",
			function()
				require("gitsigns").next_hunk()
			end,
			desc = "Go to next hunk.",
		},
	},
	config = function()
		require("gitsigns").setup({
			preview_config = {
				border = { " " },
			},
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				changedelete = { text = "_" },
				delete = { text = "x" },
				topdelete = { text = "-" },
				untracked = { text = "|" },
			},
		})
	end,
}
