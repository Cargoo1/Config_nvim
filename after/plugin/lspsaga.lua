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
-- Desactiva el autocmd interno de la bombilla de lspsaga

