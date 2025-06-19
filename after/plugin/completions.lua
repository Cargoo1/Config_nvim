-- Set up nvim-cmp.
local cmp = require('cmp')
require("luasnip.loaders.from_vscode").lazy_load()
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
	window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      col_offset = -3,
      side_padding = 1,
      border = "rounded",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
    }),
	},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
	sources = cmp.config.sources({
	{
		name = 'nvim_lsp',
		entry_filter = function(entry)				-- Filtra las entradas de tipo "Text"
			return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Text
		end,
	},
    { name = 'buffer' },-- Variables y funciones del archivo actual
	{ name = 'luasnip' },
    { name = 'path' },           -- Rutas de archivos
	}),
})

