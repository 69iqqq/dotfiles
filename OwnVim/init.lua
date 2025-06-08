-- ============================================
-- 📦 Bootstrap LazyVim, plugins and base46
-- ============================================

-- Set the base46 cache path BEFORE lazy setup
-- vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Load LazyVim and user plugin configs
require("config.lazy")
require("config.run")

-- ============================================
-- 🛠 LSP Setup
-- ============================================
require("lspconfig").clangd.setup({})

-- ============================================
-- 🎨 Transparency (for OneDark / others)
-- ============================================
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- ============================================
-- 💡 Statusline (using theme highlights)
-- ============================================
-- You can use mini.statusline or custom statusline like below
-- require("mini.statusline").setup()

-- vim.o.statusline = table.concat({
--   "%#StatusLine#", -- Highlight group
--   " %-5{toupper(mode())} ", -- Mode (normal, insert, etc.)
--
--   "%#StatusLine#", -- File info
--   " %<%f", -- File path
--   "%{&modified ? ' ●' : ''}", -- Modified flag
--   "%{&readonly ? ' 🔒' : ''}", -- Readonly flag
--   "%{expand('%') == '' ? '[No Name]' : ''}",
--
--   "%=", -- Spacer
--
--   "%#StatusLine#", -- Right-side info
--   " unix ",
--   " %{&fileencoding} ",
--   " %p%%  %l:%c ",
-- })
--
-- ============================================
-- 🌈 Load Base46 Highlights
-- ============================================

--Method 1 (load specific modules if lazy loaded)
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

-- OR Method 2 (load all highlight files)
-- for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
--   dofile(vim.g.base46_cache .. v)
-- end
