require("config.autocmds")
require("config.keymaps")
require("config.options")

if not vim.g.vscode then
	local opts = { noremap = true, silent = true }
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazypath) then
		vim.cmd("echo 'ALERT: `lazy.nvim` not found. Installing...' | redraw")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
		vim.cmd("echo 'SUCCESS: `lazy.nvim` installed.' | redraw")
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({ { import = "plugin" }, { import = "plugin.lsp" } }, {
		change_detection = { enabled = false },
		checker = { enabled = false },
		defaults = { lazy = true, version = false },
		install = {
			colorscheme = { "default" },
		},
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"spellfile",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
		ui = {
			border = "none",
			icons = {
				cmd = "[CMD]",
				config = "[CFG]",
				event = "[EVT]",
				ft = "[FT]",
				init = "[INI]",
				import = "[IMP]",
				keys = "[KEY]",
				lazy = "[LZY]",
				loaded = "[LD]",
				not_loaded = "[!LD]",
				plugin = "[PLG]",
				runtime = "[RT]",
				require = "[REQ]",
				source = "[SRC]",
				start = "[STR]",
				task = "[TSK]",
				list = {
					"@",
					"+",
					"*",
					"-",
				},
			},
		},
	})
	require("config.statusline")

	opts.desc = "Open Lazy."
	vim.keymap.set("n", "<leader><Space>", "<cmd>Lazy<cr>", opts)
end
