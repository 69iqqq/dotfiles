-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     enabled = true,
--     opts = {
--       options = {
--         icons_enabled = true,
--         theme = "auto",
--         component_separators = { left = "", right = "" },
--         section_separators = { left = "", right = "" },
--         disabled_filetypes = {
--           statusline = {},
--           winbar = {},
--         },
--         ignore_focus = {},
--         always_divide_middle = true,
--         always_show_tabline = true,
--         globalstatus = false,
--         refresh = {
--           statusline = 100,
--           tabline = 100,
--           winbar = 100,
--         },
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch", "diff", "diagnostics" },
--         lualine_c = { "filename" },
--         lualine_x = { "filetype" },
--         lualine_y = { "progress" },
--         lualine_z = { "location" },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { "filename" },
--         lualine_x = { "location" },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       winbar = {},
--       inactive_winbar = {},
--       extensions = {},
--     },
--   },
-- }
return {
  "nvim-lualine/lualine.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    return opts
  end,
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   enabled = true,
--   event = "VeryLazy",
--   init = function()
--     vim.g.lualine_laststatus = vim.o.laststatus
--     if vim.fn.argc(-1) > 0 then
--       vim.o.statusline = " "
--     else
--       vim.o.laststatus = 0
--     end
--   end,
--   opts = function()
--     vim.o.laststatus = vim.g.lualine_laststatus
--
--     local opts = {
--       options = {
--         theme = "auto",
--         globalstatus = vim.o.laststatus == 3,
--         section_separators = { left = "", right = "" },
--         component_separators = { left = "", right = "" },
--         disabled_filetypes = {
--           statusline = { "alpha", "starter" },
--         },
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = {},
--         lualine_c = {
--           {
--             "filename",
--             path = 1,
--             symbols = {
--               modified = " ●",
--               readonly = " 🔒",
--               unnamed = "[No Name]",
--             },
--           },
--         },
--         lualine_x = {
--           {
--             function()
--               return "unix"
--             end,
--             color = {},
--             padding = { left = 1, right = 1 },
--           },
--           { "encoding", color = {}, padding = { left = 2, right = 1 } },
--           { "%p%%  %l:%c", color = {}, padding = { left = 1, right = 1 } },
--         },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       extensions = { "neo-tree", "lazy", "fzf" },
--     }
--
--     return opts
--   end,
-- }
