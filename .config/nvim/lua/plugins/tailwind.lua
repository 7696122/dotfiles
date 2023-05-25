return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   { "roobert/tailwindcss-colorizer.nvim", config = true },
    -- },
    opts = function(_, opts)
      -- color 함께 icon을 보여주게
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
