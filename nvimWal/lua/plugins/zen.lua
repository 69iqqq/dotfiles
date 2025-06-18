return {
  "folke/zen-mode.nvim",
  lazy = false,
  opts = {
    window = {
      backdrop = 1,
      width = 120,
      height = 1,
      options = {
        -- signcolumn = "no",
        -- number = false,
        -- relativenumber = false,
        -- cursorline = false,
        -- cursorcolumn = false,
        -- foldcolumn = "0",
        -- list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = true },
      todo = { enabled = false },
      kitty = {
        enabled = false,
        font = "+4",
      },
      alacritty = {
        enabled = false,
        font = "14",
      },
      wezterm = {
        enabled = false,
        font = "+4",
      },
      neovide = {
        enabled = false,
        scale = 1.2,
        disable_animations = {
          neovide_animation_length = 0,
          neovide_cursor_animate_command_line = false,
          neovide_scroll_animation_length = 0,
          neovide_position_animation_length = 0,
          neovide_cursor_animation_length = 0,
          neovide_cursor_vfx_mode = "",
        },
      },
    },
    on_open = function(win)
      -- custom code when Zen mode opens
    end,
    on_close = function()
      -- custom code when Zen mode closes
    end,
  },
}
