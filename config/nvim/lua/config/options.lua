-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0

-- run ":h <option>" for more information.
-- ":h colorcolumn"
vim.o.colorcolumn = "80,100,120"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.formatoptions = "jcroqlnt"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.guicursor = ""
vim.o.hlsearch = false
vim.o.ignorecase = false
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
vim.o.updatetime = 200
vim.o.wildignore = "*/.git/*,*/.node_modules/*"
vim.o.wrap = false

-- disabled runtime plugins
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

-- disable recommended style
vim.g.python_recommended_style = 0
