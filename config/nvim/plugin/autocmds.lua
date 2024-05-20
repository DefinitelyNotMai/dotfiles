vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("indent", { clear = true }),
	callback = function()
		vim.o.expandtab = true
		vim.o.shiftwidth = 2
		vim.o.softtabstop = 2
		vim.o.tabstop = 2
	end,
	pattern = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"markdown",
		"typescript",
		"typescriptreact",
	},
	desc = "Set indentation to 2 spaces for specific filetypes.",
})

vim.api.nvim_create_autocmd("FocusGained", {
	group = vim.api.nvim_create_augroup("checktime", { clear = true }),
	command = "checktime",
	pattern = "*",
	desc = "Reload file when it changes outside of neovim.",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = "*",
	desc = "Highlight on yank.",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("spell_wrap", { clear = true }),
	callback = function()
		vim.o.wrap = true
		vim.o.spell = true
	end,
	pattern = { "gitcommit", "markdown" },
	desc = "Enable line wrap and spell check for gitcommit and markdown files.",
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = vim.api.nvim_create_augroup("vert_center", { clear = true }),
	command = "normal zz",
	pattern = "*",
	desc = "Center document when entering insert mode.",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
	callback = function(e)
		if e.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(e.match) or e.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
	desc = "Auto create directory.",
})
