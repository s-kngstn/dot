return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require('oil')
    local keymap = vim.keymap

    keymap.set('n', '-', function()
      vim.cmd("Oil")
    end, {desc = "Open parent directory"})

    oil.setup({
      default_file_explorer = false,

      -- Your configuration comes here
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    })
  end
}

