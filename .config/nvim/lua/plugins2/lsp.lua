return {
  -- {
  --   "neovim/nvim-lspconfig",
  -- },
  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require("lazy").setup({
        "VidocqH/lsp-lens.nvim",
      })
      require("lsp-lens").setup({
        enable = true,
        include_declaration = true, -- Reference include declaration
        sections = { -- Enable / Disable specific request
          definition = true,
          references = true,
          implementation = true,
        },
        ignore_filetype = {
          "prisma",
        },
      })
    end,
  },
}
