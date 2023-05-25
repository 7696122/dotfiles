return {
  {
    "wuelnerdotexe/vim-astro",
    config = function()
      vim.g.astro_typescript = "enable"
      -- vim.g.astro_stylus = "enable"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      require("lspconfig").astro.setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
      },
    },
  },
}
