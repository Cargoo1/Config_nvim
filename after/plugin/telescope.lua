require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-j>'] = require('telescope.actions').move_selection_previous,
				['<C-k>'] = require('telescope.actions').move_selection_next,

			}
		}
	}
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>cs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
