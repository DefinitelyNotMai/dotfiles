return {
	"iamcco/markdown-preview.nvim",
	keys = {
		{
			"<leader>md",
			"<cmd>MarkdownPreview<cr>",
			desc = "Toggle Markdown preview.",
			noremap = true,
			silent = true,
		},
	},
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
