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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(e)
		vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", {
			buffer = e.buf,
			desc = "Show current line diagnostics.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {
			buffer = e.buf,
			desc = "Go to previous diagnostic.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", {
			buffer = e.buf,
			desc = "Go to next diagnostic.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", {
			buffer = e.buf,
			desc = "Open code actions.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", {
			buffer = e.buf,
			desc = "Show documentation for word under cursor.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {
			buffer = e.buf,
			desc = "Go to definition.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {
			buffer = e.buf,
			desc = "Go to declaration.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {
			buffer = e.buf,
			desc = "Show implementations.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {
			buffer = e.buf,
			desc = "Show references.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {
			buffer = e.buf,
			desc = "Show type definition.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", {
			buffer = e.buf,
			desc = "Rename with LSP.",
			noremap = true,
			silent = true,
		})

		vim.keymap.set("n", "<C-s>", "<cmd>lua vim.lsp.buf.format()<cr>", {
			buffer = e.buf,
			desc = "Format with LSP.",
			noremap = true,
			silent = true,
		})
	end,
	desc = "Assign specific keymaps when lsp attaches.",
})
