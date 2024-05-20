-- buffer {{{
vim.keymap.set("n", "[b", "<CMD>bprevious<CR>", {
	desc = "Go to previous buffer.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "]b", "<CMD>bnext<CR>", {
	desc = "Go to next buffer.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<LEADER>bd", "<CMD>bdelete<CR>", {
	desc = "Delete current buffer.",
	noremap = true,
	silent = true,
})
-- }}}

-- quickfix {{{
vim.keymap.set("n", "[c", "<CMD>cprevious<CR>", {
	desc = "Go to previous quickfix item.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "]c", "<CMD>cnext<CR>", {
	desc = "Go to next quickfix item.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<LEADER>co", "<CMD>copen<CR>", {
	desc = "Open quickfix window.",
	noremap = true,
	silent = true,
})
-- }}}

-- text manipulation {{{
vim.keymap.set("n", "x", '"_x', {
	desc = "Delete character into void register.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<S-j>", "mzJ`z", {
	desc = "Concatenate with line below.",
	noremap = true,
	silent = true,
})

vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", {
	desc = "Move selection down and autoindent.",
	noremap = true,
	silent = true,
})

vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", {
	desc = "Move selection up and autoindent.",
	noremap = true,
	silent = true,
})

vim.keymap.set("v", "<LEADER>y", '"+y', {
	desc = "Yank selected text to system clipboard.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<LEADER>p", '"+p', {
	desc = "Paste after cursor from system clipboard.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<LEADER><S-p>", '"+<S-p>', {
	desc = "Paste before cursor from system clipboard.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<S-s>", ":%s/", {
	desc = "Search and replace.",
	noremap = true,
	silent = true,
})
-- }}}

-- navigation {{{
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
	desc = "Half page down and center screen.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {
	desc = "Half page up and center screen.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "n", "nzzzv", {
	desc = "Move to next search result and center screen.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<S-n>", "<S-n>zzzv", {
	desc = "Move to previous search result and center screen.",
	noremap = true,
	silent = true,
})
-- }}}

-- other {{{
vim.keymap.set("n", "<LEADER>s", "<CMD>lua vim.o.spell = not vim.o.spell<CR>", {
	desc = "Toggle spellcheck.",
	noremap = true,
	silent = true,
})
-- }}}
