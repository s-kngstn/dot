return {
        "folke/tokyonight.nvim",
        priority = 1000, -- make sure to load this before all other plugins
        -- config function runs when the plug-in loads
        config = function()
            -- load colorscheme
            vim.cmd([[colorscheme tokyonight]])
        end,
    }
