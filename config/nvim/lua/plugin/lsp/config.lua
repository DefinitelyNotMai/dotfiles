local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	opts.buffer = bufnr

	opts.desc = "Show current line diagnostics."
	vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

	opts.desc = "Go to previous diagnostic."
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)

	opts.desc = "Go to next diagnostic."
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

	opts.desc = "Open code actions."
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

	opts.desc = "Show documentation for word under cursor."
	vim.keymap.set("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

	opts.desc = "Go to definition."
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

	opts.desc = "Go to declaration."
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

	opts.desc = "Show implementations."
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

	opts.desc = "Show references."
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

	opts.desc = "Show type definition."
	vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

	opts.desc = "Rename with LSP."
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	opts.desc = "Format with LSP."
	vim.keymap.set("n", "<C-s>", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
end

return M
