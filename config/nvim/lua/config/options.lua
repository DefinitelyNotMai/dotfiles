-- global variables {{{
-- leader key
vim.g.mapleader = " "

-- netrw
vim.g.netrw_banner = 0

-- runtime plugins
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
-- }}}

-- vim options {{{
-- run `:h <option>` for more information.
-- `:h colorcolumn`
vim.o.colorcolumn = "80,100,120"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true
vim.o.foldmethod = "marker"
vim.o.formatoptions = "jcroqlnt"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.guicursor = ""
vim.o.inccommand = "nosplit"
vim.o.iskeyword = vim.o.iskeyword .. ",-"
vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = "eol:*,extends:>,leadmultispace:| ,nbsp:%,precedes:<,tab:>-,trail:_"
vim.o.mouse = ""
vim.o.number = true
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes"
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 200
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.o.undofile = true
vim.o.wildignore = "*/node_modules/*"
vim.o.wrap = false
-- }}}

-- statusline {{{
_G.cmp = {}

_G.cmp.diagnostics = function()
	return table.concat({
		"E:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
		"W:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
		"I:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
		"H:" .. #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HELP }),
	}, " ")
end

_G.cmp.file_info = function()
	return table.concat({
		vim.bo.fileencoding,
		vim.bo.fileformat,
		vim.bo.filetype,
	}, " ")
end

vim.o.statusline = table.concat({
	" %t%m%r%h%w",
	"%{%v:lua.cmp.diagnostics()%}",
	"%=",
	"%{%v:lua.cmp.file_info()%}",
	"%v:%l ",
}, " | ")
-- }}}
