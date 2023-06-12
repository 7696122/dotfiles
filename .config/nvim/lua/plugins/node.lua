return {
  {
    "vuki656/package-info.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("package-info").setup()
    end,
  },
}
