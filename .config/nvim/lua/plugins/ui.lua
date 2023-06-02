return {
  {
    "tenxsoydev/tabs-vs-spaces.nvim",
    config = true,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        integrations = {
          gitgutter = true,
          gitsigns = true,
        },
      })
    end,
  },
}
