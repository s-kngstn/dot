-- copilot-chat.lua
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- no copilot.lua here
    build = "make tiktoken",
    opts = {
      -- your opts kept
      model = "gpt-4.1",
      temperature = 0.1,
      window = { layout = "vertical", width = 0.5 },
      auto_insert_mode = true,
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
      vim.keymap.set("n", "<leader>co", function() chat.open() end,
        { desc = "Open Copilot Chat", silent = true })
      vim.keymap.set("n", "<leader>cc", function() chat.close() end,
        { desc = "Close Copilot Chat", silent = true})
    end,
  },
}

