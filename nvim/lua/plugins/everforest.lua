return {
  "sainnhe/everforest",
  priority = 1000,
  lazy = false,
  config = function()
    -- set the background (choose "soft", "medium", or "hard")
    vim.g.everforest_background = "medium"
    -- enable transparent background
    vim.g.everforest_transparent_background = 1
    -- disable italics if you want
    vim.g.everforest_enable_italic = 1
    vim.cmd.colorscheme("everforest")
  end,
}
