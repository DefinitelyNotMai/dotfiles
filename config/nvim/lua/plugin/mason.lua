return {
	"williamboman/mason.nvim",
	dependencies = "williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>mm",
			"<cmd>Mason<cr>",
			desc = "Open Mason.",
			noremap = true,
			silent = true,
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "none",
				icons = {
					package_installed = "[*]",
					package_pending = "[~]",
					package_uninstalled = "[x]",
				},
			},
		})

		-- auto install formatters and linters
		for _, pkg_name in ipairs({
			"eslint_d",
			"goimports",
			"golangci-lint",
			"prettier",
			"stylua",
		}) do
			local ok, pkg = pcall(require("mason-registry").get_package, pkg_name)
			if ok then
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				-- auto install language servers
				"bashls",
				"clangd",
				"cssls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"svelte",
				"tailwindcss",
				"tsserver",
			},
		})
	end,
}
