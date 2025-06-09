return {
  "epwalsh/pomo.nvim",
  dependencies = {
    "rcarriga/nvim-notify", -- optional but recommended
  },
  opts = {
    -- example configuration
    time = 25, -- default pomodoro time in minutes
    break_time = 5, -- break time in minutes
    autostart_break = true,
  },
  event = "VeryLazy", -- or "BufReadPre" if you want it earlier
  keys = {
    {
      "<leader>tp",
      function()
        require("pomo").start()
      end,
      desc = "Start Pomodoro",
    },
    {
      "<leader>ts",
      function()
        require("pomo").stop()
      end,
      desc = "Stop Pomodoro",
    },
  },
}
