return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      {
        "mrjones2014/legendary.nvim",
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
      },
    },
    config = function()
      require("telescope").load_extension("lazygit")
      require("legendary").setup({
        keymaps = {
          { "<C-g>", "<cmd>LazyGit<CR>", description = "Lazygit" },
        },
      })
    end,
  },
}
