return {
	"echasnovski/mini.pick",
	keys = {
		{
			"<LEADER>fb",
			function()
				require("mini.pick").builtin.buffers()
			end,
		},
		{
			"<LEADER>ff",
			function()
				require("mini.pick").builtin.files({ tool = "fd" })
			end,
		},
		{
			"<LEADER>f<S-f>",
			function()
				require("mini.pick").builtin.files({ tool = "git" })
			end,
		},
		{
			"<LEADER>fg",
			function()
				require("mini.pick").builtin.grep_live({ tool = "rg" })
			end,
		},
		{
			"<LEADER>fh",
			function()
				require("mini.pick").builtin.help()
			end,
		},
	},
	config = function()
		vim.cmd("hi MiniPickPrompt guibg=#07080d guifg=#e0e2ea")
		vim.cmd("hi MiniPickBorderText guibg=#07080d guifg=#e0e2ea")
		require("mini.pick").setup({
			source = { show = require("mini.pick").default_show },
			window = {
				config = {
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				},
				prompt_prefix = "━ ",
			},
		})
	end,
}
