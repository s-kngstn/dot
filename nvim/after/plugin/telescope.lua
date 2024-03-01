local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- project file search
vim.keymap.set('n', '<leader>pa', [[<cmd>lua require('telescope.builtin').find_files({ hidden = true, prompt_title = 'All Files' })<CR>]], {}) -- project file search (hidden)
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- git file search
vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- search recent buffers
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end) -- project search / grep files (requires globaly installing ripgrep)
