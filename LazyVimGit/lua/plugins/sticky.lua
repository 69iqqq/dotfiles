return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup({
      enable = true, -- enable by default
      max_lines = 3, -- how many context lines
    })
  end,
}
