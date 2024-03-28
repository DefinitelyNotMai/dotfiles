local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- buffer
opts.desc = "Go to previous buffer."
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", opts)

opts.desc = "Go to next buffer"
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", opts)

opts.desc = "Delete current buffer."
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", opts)

-- quickfix
opts.desc = "Go to previous quickfix item."
vim.keymap.set("n", "[c", "<cmd>cprevious<cr>", opts)

opts.desc = "Go to next quickfix item."
vim.keymap.set("n", "]c", "<cmd>cnext<cr>", opts)

opts.desc = "Open quickfix window."
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", opts)

-- text manipulation
opts.desc = "Delete character into void register."
vim.keymap.set("n", "x", '"_x', opts)

opts.desc = "Concatenate with line below."
vim.keymap.set("n", "<S-j>", "mzJ`z", opts)

opts.desc = "Move selection down and autoindent."
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", opts)

opts.desc = "Move selection up and autoindent."
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", opts)

opts.desc = "Decrease indent."
vim.keymap.set("v", "<", "<gv", opts)

opts.desc = "Increase indent."
vim.keymap.set("v", ">", ">gv", opts)

opts.desc = "Yank selected text to system clipboard."
vim.keymap.set("v", "<leader>y", '"+y', opts)

opts.desc = "Paste from system clipboard."
vim.keymap.set("n", "<leader>p", '"+p', opts)

opts.desc = "Paste before cursor from system clipboard."
vim.keymap.set("n", "<leader><S-p>", '"+P', opts)

-- navigation and center
opts.desc = "Half page down and center screen."
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

opts.desc = "Half page up and center screen."
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

opts.desc = "Move to next search result and center screen."
vim.keymap.set("n", "n", "nzzzv", opts)

opts.desc = "Move to previous search result and center screen."
vim.keymap.set("n", "N", "Nzzzv", opts)

-- other
opts.desc = "Toggle spellcheck."
vim.keymap.set("n", "<leader><S-s>", "<cmd>lua vim.o.spell = not vim.o.spell<cr>", opts)

opts.desc = "Open NetRW."
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", opts)

opts.desc = "Insert error-checking template (for golang)."
vim.keymap.set("n", "<leader>xg", "oif err != nil {<cr>}<esc>Oreturn err<esc>", opts)

opts.desc = "Search and replace."
vim.keymap.set("n", "<S-s>", ":%s/", opts)
