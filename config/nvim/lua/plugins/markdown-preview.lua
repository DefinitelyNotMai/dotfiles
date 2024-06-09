return {
	"iamcco/markdown-preview.nvim",
	keys = {
		{
			"<LEADER>md",
			"<CMD>MarkdownPreview<CR>",
			desc = "Toggle markdown preview.",
		},
	},
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
