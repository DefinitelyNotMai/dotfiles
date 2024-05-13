local M = {}

M.plugin = {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		user_default_options = {
			css = true,
			css_fn = true,
			tailwind = true,
		},
	},
	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}

return M.plugin
