return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- Noice options go here
    -- You can also set the notification view to use nvim-notify
    notify = {
      -- Use nvim-notify for notifications
      enabled = true,
      view = "notify",
      opts = {
        background_colour = "#000000", -- pure black
        stages = "fade_in_slide_out",
        timeout = 3000,
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- Optional: nvim-notify for notifications
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "#000000", -- pure black
          stages = "fade_in_slide_out",
          timeout = 3000,
        })
        -- Set notify as the default vim.notify
        vim.notify = require("notify")
      end,
    },
  },
}

