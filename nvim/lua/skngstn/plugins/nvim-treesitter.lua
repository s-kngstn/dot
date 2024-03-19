return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {},
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")
      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        -- ensure these language parsers are installed
        ensure_installed = "all",
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        autotag = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
