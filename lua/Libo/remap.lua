local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- copying to system clipboard
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>p", "\"+p", opts)
keymap("n", "<leader>p", "\"+p", opts)

-- Modes
--   normal_mode = "n",
--   insert_mdoe = "i",
--   visual_mode = "v",
--   visual_block_mode = "x"
--   term_mode = "t",
--   command_mode = "c"

-- Normal --
-- Search and replace word under cursor
keymap("n", "<F2>", ":%s/<C-r><C-w>/gc<C-f>$F/i", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter normal mode (can also use <C-[>)
-- keymap("i","jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts) -- I set this up as <leader>p

-- Visual block --
-- Move text up and down
keymap("x", "J", ":move '<+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Paste over text without copying the deleted text (This can be done with P)
-- keymap("x", "<leader>p", "\"_dp", opts)


