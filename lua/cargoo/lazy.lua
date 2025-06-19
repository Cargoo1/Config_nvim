-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
local plugins = {

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'navarasu/onedark.nvim',
		as = 'onedark',
		config = function()
			require('onedark').setup {
				style = 'darker',  -- Puedes cambiarlo a 'dark', 'cool', etc.
				transparent = true,
				colors = {
				func = "#56B6C2"-- Azul claro para funciones
				},
				highlights = {
					["@function"] = {fg = '#40E0D0', fmt = 'italic'},
					["@type"] = {fg = '#DE3163'},
					["@type.builtin"] = {fg = '#DE3163'},
				}-- Hacer el fondo transparente
				--colors = {
				--},
				--highlights = {
				--	["@keyword"] = {fg = '#56B6C2'},
					--["@string"] = {fg = '$bright_orange', fmt = 'bold'},
					--["@function.builtin"] = {fg = '#0059ff'}
				--}
			}
			require('onedark').load()
		end
	},

	'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',

	'ThePrimeagen/harpoon',

	'mbbill/undotree' ,

	'tpope/vim-fugitive' ,

	{
		-- Main LSP Configuration
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			'hrsh7th/cmp-nvim-lsp',
		},
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			-- This is your opts table
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
							-- even more opts
						}
					}
				}
			}
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after init function:
			require("telescope").load_extension("ui-select")
		end
	},
	-- cmp
	{
		"hrsh7th/nvim-cmp"
	},

	{
		"hrsh7th/cmp-nvim-lsp"
	},

	{'hrsh7th/cmp-buffer'},              -- Fuente buffer (variables locales)
	{'hrsh7th/cmp-path'},                -- Fuente de rutas
	{'hrsh7th/cmp-cmdline'},             -- Autocompletado para línea de comandos

	-- luasnip
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"
		},
	},


	{
		'42Paris/42header',
		config = function()
			vim.g.r42 = "acamargo"
			vim.g.mail42 = "acamargo@student.42.fr"
		end
	},

	{"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup{
			size =12,
			shade_terminals = true,
			persist_mode = false,
			start_in_insert = true,
			direction = "horizontal",
			horizontal_opts = {
				border = "curved",
			},
		}
	end},
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", 'leoluz/nvim-dap-go'} },
	{
		"nvim-neotest/nvim-nio"
	},
	{
		"ThePrimeagen/vim-be-good"
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional pero recomendado
			"nvim-tree/nvim-web-devicons",     -- optional para iconos
		},
	},
}

require("lazy").setup(plugins, {})
