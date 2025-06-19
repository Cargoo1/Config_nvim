-- Muestra mensajes de error flotantes automáticamente al pasar el cursor
-- Atajo para mostrar error flotante manualmente
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.g.mapleader = " "
vim.opt.cursorline = true
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'j', 'k', { noremap = true })
vim.keymap.set('n', 'k', 'j', { noremap = true })
vim.keymap.set('v', 'j', 'k', { noremap = true })
vim.keymap.set('v', 'k', 'j', { noremap = true })
vim.keymap.set('o', 'j', 'k', { noremap = true })
vim.keymap.set('o', 'k', 'j', { noremap = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-s>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")
-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!cc -Wall -Wextra -Werror  %<CR>", { silent = true })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
-- Mapea <Esc> para cerrar la terminal en modo terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:ToggleTerm<CR>")

vim.keymap.set("n", "W", "<cmd>w<CR>")
