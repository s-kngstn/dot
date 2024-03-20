return {
  'github/copilot.vim',
  config = function()
    vim.cmd([[
      imap <silent><expr> <C-J> copilot#Accept("\<CR>")
      imap <silent><expr> <C-K> copilot#Dismiss()
      let g:copilot_no_tab_map = v:true
    ]])
  end,
}
