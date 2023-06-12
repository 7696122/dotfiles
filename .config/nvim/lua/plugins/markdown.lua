return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    -- setup = {
    --   run = function()
    --     vim.fn["mkdp#util#install"]()
    --   end,
    -- },
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    -- setup = {
    --   run = function()
    --     vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    --   end,
    -- },
  },
  -- {
  --   "ixru/nvim-markdown",
  --   -- cmd = "",
  --   -- keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
  -- },
}
