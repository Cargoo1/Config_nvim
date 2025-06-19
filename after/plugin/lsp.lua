-- Mason setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

-- Mason-lspconfig setup
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "ts_ls"},
	automatic_installation = true,
})

-- Configuración de nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Acepta la sugerencia seleccionada

		-- Cambiar Tab por otra combinación de teclas, por ejemplo, Ctrl+n y Ctrl+p
		['<C-n>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-p>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		-- Dejar Tab con su comportamiento normal
		-- No incluir mapeo para Tab y S-Tab aquí
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	window = {
		documentation = {
			max_height = 12,
			max_width = 60,
		}
	},
	max_item_count = 8,
})

-- Configurar autocompletado para la línea de comandos
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Configuración de capacidades LSP para autocompletado
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Config
local lspconfig = require("lspconfig")

-- Lua LSP
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

-- C/C++ LSP (Clangd)
lspconfig.clangd.setup({
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm"
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true
	},
})

-- Keybindings para LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>cc', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
