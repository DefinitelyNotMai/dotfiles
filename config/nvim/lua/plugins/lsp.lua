return {
	-- lspconfig {{{
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
			"mfussenegger/nvim-lint",
		},
		event = { "BufReadPre", "BufNewFile" },
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

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", { clear = true }),
				callback = function(e)
					vim.keymap.set("n", "<LEADER>d", "<CMD>lua vim.diagnostic.open_float()<CR>", {
						buffer = e.buf,
						desc = "Show current line diagnostics.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", {
						buffer = e.buf,
						desc = "Go to previous diagnostic.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", {
						buffer = e.buf,
						desc = "Go to next diagnostic.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "<LEADER>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", {
						buffer = e.buf,
						desc = "Open code actions.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "<S-k>", "<CMD>lua vim.lsp.buf.hover()<CR>", {
						buffer = e.buf,
						desc = "Show documentation for word under cursor.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", {
						buffer = e.buf,
						desc = "Go to definition.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", {
						buffer = e.buf,
						desc = "Go to declaration.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", {
						buffer = e.buf,
						desc = "Show implementations.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", {
						buffer = e.buf,
						desc = "Show references.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", {
						buffer = e.buf,
						desc = "Show type definition.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "<LEADER>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", {
						buffer = e.buf,
						desc = "Rename with LSP.",
						noremap = true,
						silent = true,
					})

					vim.keymap.set("n", "<C-s>", "<CMD>lua vim.lsp.buf.format()<CR>", {
						buffer = e.buf,
						desc = "Format with LSP.",
						noremap = true,
						silent = true,
					})
				end,
				desc = "Assign specific keymaps when lsp attaches.",
			})
		end,
	},
	-- }}}

	-- mason {{{
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
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
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				},
			})
			local mr = require("mason-registry")
			local ensure_installed = function()
				for _, pkg_name in ipairs({
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
				}) do
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
		config = function()
			require("conform").setup({
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
			})
		end,
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
