local M = {}

M.plugin = {
	-- lspconfig {{{
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"angularls",
				"bashls",
				"clangd",
				"cssls",
				"dockerls",
				"gopls",
				"html",
				"htmx",
				"jsonls",
				"marksman",
				"pyright",
				"rust_analyzer",
				"svelte",
				"tailwindcss",
				"templ",
				"tsserver",
			}
			local lspconfig = require("lspconfig")

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			})

			for _, lsp in pairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
					flags = {
						debounce_text_changes = 150,
					},
				})
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						runtime = { "LuaJIT" },
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePost", {
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
						end,
						pattern = { "*.js", "*.ts" },
					})
				end,
			})
		end,
	},
	-- }}}

	-- mason {{{
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		build = ":MasonUpdate",
		dependencies = {
			"stevearc/conform.nvim",
			"mfussenegger/nvim-lint",
			"neovim/nvim-lspconfig",
		},
		keys = {
			{
				"<leader>mm",
				"<cmd>Mason<cr>",
				desc = "Open Mason.",
				noremap = true,
				silent = true,
			},
		},
		opts = function()
			return {
				ensure_installed = {
					-- formatter
					"prettierd",
					"stylua",
					-- linter
					"eslint_d",
					"golangci-lint",
					-- lsp
					"angular-language-server",
					"bash-language-server",
					"dockerfile-language-server",
					"clangd",
					"css-lsp",
					"gopls",
					"html-lsp",
					"htmx-lsp",
					"json-lsp",
					"lua-language-server",
					"marksman",
					"pyright",
					"rust-analyzer",
					"svelte-language-server",
					"tailwindcss-language-server",
					"templ",
					"typescript-language-server",
				},
				ui = {
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
					icons = {
						package_installed = "[*]",
						package_pending = "[~]",
						package_uninstalled = "[x]",
					},
				},
			}
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local ensure_installed = function()
				for _, pkg_name in ipairs(opts.ensure_installed) do
					local pkg = mr.get_package(pkg_name)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	-- }}}

	-- formatter {{{
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				rustfmt = {
					command = "/usr/bin/rustfmt",
				},
			},
			formatters_by_ft = {
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				rust = { "rustfmt" },
				svelte = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
			},
			format_on_save = {
				async = false,
				lsp_fallback = false,
			},
		},
	},
	-- }}}

	-- linter {{{
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				go = { "golangcilint" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("linting", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
				pattern = {
					"*.go",
					"*.js",
					"*.jsx",
					"*.svelte",
					"*.ts",
					"*.tsx",
				},
				desc = "Run linter.",
			})
		end,
	},
	-- }}}
}

return M.plugin
