local M = {}

M.plugin = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},
	keys = {
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Find buffers.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Find diagnostics.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Find files.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Live grep.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Find help tags.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps({
					prompt_title = "",
				})
			end,
			desc = "Find keymaps.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").grep_string({
					prompt_title = "",
					preview_title = "",
				})
			end,
			desc = "Grep for string under cursor.",
			noremap = true,
			silent = true,
		},
		{
			"<leader>u",
			function()
				require("telescope").extensions.undo.undo({
					prompt_title = "",
				})
			end,
			desc = "Open Undotree.",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		defaults = {
			borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
			results_title = "",
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}

return M.plugin
