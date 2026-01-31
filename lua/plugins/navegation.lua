return {
	--			 --
	-- Telescope -- 
	--			 --
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		keys = {
			{"<leader>f", ":Telescope find_files<CR>", silent = true, desc = "Find files"},
			{"<leader>g", ":Telescope git_files<CR>", silent = true, desc = "Find files"}
		}
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
	--			 --
	-- Harpoon   -- 
	--			 --
	{
		'ThePrimeagen/harpoon',
	},
}
