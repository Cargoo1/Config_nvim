require('lspsaga').setup({
	ui = {
		border = "rounded",
		code_action = " ",
	},
	lightbulb = {
		enable = false,       -- Desactiva la bombilla
		enable_in_insert = false, -- Desactiva la bombilla en modo de inserción
		sign = false,         -- Desactiva el signo en la columna de signos
		sign_priority = 40,
		virtual_text = false, -- Desactiva el texto virtual
	},
	code_action_prompt = {
		enable = false,  -- Disable the code action prompt
	},
})
-- define diagnostic signs (MUST BE OUTSIDE the setup table)
-- Desactiva el autocmd interno de la bombilla de lspsaga
local signs = {Error = ' ', Warn = ' ', Info = ' ', Hint = ' '}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, desc = "Finder LSP" })
vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true, desc = "Previsualizar definición" })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, desc = "Ir a definición" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Acción de código" })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Renombrar" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Documentación flotante" })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true, desc = "Esquema del archivo" })
