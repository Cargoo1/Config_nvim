
local map = vim.keymap.set

map("n", "<leader>e", vim.diagnostic.open_float)

vim.g.mapleader = " "
vim.opt.cursorline = true
map("n", "<leader>cd", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map({"n", "v"}, "<C-d>", "<C-d>zz")
map("n", "<C-s>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", "\"_dP")
-- next greatest remap ever : asbjornHaland
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

map("n", "W", "<cmd>w<CR>")
map("n", "<leader>u", vim.cmd.UndotreeToggle)
