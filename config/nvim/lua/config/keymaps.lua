-- buffer {{{
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", {
	desc = "Go to previous buffer.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "]b", "<cmd>bnext<cr>", {
	desc = "Go to next buffer.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", {
	desc = "Delete current buffer.",
	noremap = true,
	silent = true,
})
-- }}}

-- quickfix {{{
vim.keymap.set("n", "[c", "<cmd>cprevious<cr>", {
	desc = "Go to previous quickfix item.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "]c", "<cmd>cnext<cr>", {
	desc = "Go to next quickfix item.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", {
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

vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", {
	desc = "Move selection down and autoindent.",
	noremap = true,
	silent = true,
})

vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", {
	desc = "Move selection up and autoindent.",
	noremap = true,
	silent = true,
})

vim.keymap.set("v", "<leader>y", '"+y', {
	desc = "Yank selected text to system clipboard.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>p", '"+p', {
	desc = "Paste after cursor from system clipboard.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader><S-p>", '"+<S-p>', {
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
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", {
	desc = "Open NetRW.",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader><S-s>", "<cmd>lua vim.o.spell = not vim.o.spell<cr>", {
	desc = "Toggle spellcheck.",
	noremap = true,
	silent = true,
})
-- }}}
