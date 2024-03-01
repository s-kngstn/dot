vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

-- use vim-test in toggleterm
vim.cmd([[
  let test#strategy = 'neovim'

  let g:test#neovim#term_toggleterm = 1

  let g:test#neovim#term_opts = ['toggle', 'hidden', 'dir=~/']

  let g:test#preserve_screen = 0
]])
