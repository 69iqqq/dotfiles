return {
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- Enable transparency
      terminal_colors = true, -- Enable terminal colors
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { bold = true },
        variables = {},
        sidebars = "dark", -- Style for sidebars
        floats = "dark", -- Style for floating windows
      },
      sidebars = { "qf", "help" }, -- Apply darker background to specific sidebars
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
      -- Override specific highlights for transparency
      on_highlights = function(highlights, colors)
        local transparent_groups = {
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptNormal",
          "TelescopeResultsNormal",
          "TelescopePreviewNormal",
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",
        }
        for _, group in ipairs(transparent_groups) do
          highlights[group] = { bg = "NONE", blend = 0 }
        end
      end,
    },
    config = function(_, opts)
      require("eldritch").setup(opts)
      vim.cmd("colorscheme eldritch")
    end,
  },
}
