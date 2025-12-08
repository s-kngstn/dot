return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim'},
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')
        local keymap = vim.keymap

        telescope.setup({
            pickers = {
                live_grep = {
                    additional_args = function(opts)
                        return {"--no-ignore", "-F"}
                    end
                }
            }
        })

        keymap.set('n', '<leader>pf', builtin.find_files, {}) -- project file search
        keymap.set('n', '<leader>pa', [[<cmd>lua require('telescope.builtin').find_files({ hidden = true, prompt_title = 'All Files' })<CR>]], {}) -- project file search (hidden)
        keymap.set('n', '<C-p>', builtin.git_files, {}) -- git file search
        keymap.set('n', '<leader>pb', builtin.buffers, {}) -- search recent buffers
        keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        keymap.set('n', '<leader>pg', builtin.live_grep, {}) -- new global search with live_grep
    end,
}
