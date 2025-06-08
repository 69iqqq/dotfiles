return {
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },

      sidebars = { "qf", "help" },
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
      on_highlights = function(highlights, colors)
        local transparent_groups = {
          -- "Normal",
          -- "NormalNC",
          -- "NormalFloat",
          "FloatBorder",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptNormal",
          "TelescopeResultsNormal",
          "TelescopePreviewNormal",
          "Pmenu",
          "PmenuSbar",
          "PmenuThumb",
        }
        for _, group in ipairs(transparent_groups) do
          highlights[group] = { bg = "NONE", blend = 0 }
        end
        -- Make selected item distinct
        highlights.PmenuSel = { fg = colors.bg, bg = colors.purple, bold = true }
      end,
    },
    config = function(_, opts)
      require("eldritch").setup(opts)
      -- vim.cmd("colorscheme eldritch")
    end,
  },
}
