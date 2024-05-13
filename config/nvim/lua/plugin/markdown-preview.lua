local M = {}

M.plugin = {
	"iamcco/markdown-preview.nvim",
	keys = {
		{
			"<leader>md",
			"<cmd>MarkdownPreview<cr>",
			desc = "Toggle markdown preview.",
			noremap = true,
			silent = true,
		},
	},
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}

return M.plugin
