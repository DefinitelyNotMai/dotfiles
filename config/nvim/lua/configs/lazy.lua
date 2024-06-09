local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.cmd("echo '[ALERT]: `lazy.nvim` not found. Installing...' | redraw")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --latest stable release
		lazypath,
	})
	vim.cmd("echo '[SUCCESS]: `lazy.nvim` installed.' | redraw")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = { enabled = false },
	defaults = { lazy = true, version = false },
	install = { colorscheme = { "default" } },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"spellfile",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
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

vim.keymap.set("n", "<LEADER><SPACE>", "<CMD>Lazy<CR>", { desc = "Open Lazy." })
