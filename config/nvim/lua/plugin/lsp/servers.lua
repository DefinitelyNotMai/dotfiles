local config = require("plugin.lsp.config")
local lspconfig = require("lspconfig")

lspconfig.bashls.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.clangd.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.cssls.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.gopls.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.html.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.jsonls.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.lua_ls.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				"LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.marksman.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.pyright.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.rust_analyzer.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.svelte.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

--[[
lspconfig.svelte.setup({
	capabilities = config.capabilities,
	on_attach = function(client, bufnr)
		config.on_attach(client, bufnr)

		autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				if client.name == "svelte" then
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end
			end,
		})
	end,
})
]]

lspconfig.tailwindcss.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})

lspconfig.tsserver.setup({
	capabilities = config.capabilities,
	on_attach = config.on_attach,
})
