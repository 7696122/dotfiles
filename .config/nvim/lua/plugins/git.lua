return {
  {
    "aspeddro/gitui.nvim",
    config = function()
      require("gitui").setup({
        -- Command Options
        command = {
          -- Enable :Gitui command
          -- @type: bool
          enable = true,
        },
        -- Path to binary
        -- @type: string
        binary = "gitui",
        -- Argumens to gitui
        -- @type: table of string
        args = {},
        -- WIndow Options
        window = {
          options = {
            -- Width window in %
            -- @type: number
            width = 100,
            -- Height window in %
            -- @type: number
            height = 100,
            -- Border Style
            -- Enum: "none", "single", "rounded", "solid" or "shadow"
            -- @type: string
            border = "rounded",
          },
        },
      })
    end,
  },
  -- { "airblade/vim-gitgutter" },
}
