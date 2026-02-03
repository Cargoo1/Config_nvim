vim.lsp.enable({
    "clangd",
})
vim.diagnostic.config({
    virtual_lines = true,
	virtual_lines = {
		source = "if_many",
		format = function(diagnostic)
			if diagnostic.source == 'clangd' then
				return string.gsub(diagnostic.message, "^[%w%-_]+: ", "")
			end
			return diagnostic.message
		end,
	},
    -- virtual_text = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
