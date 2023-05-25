return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "renerocksai/calendar-vim" },
    },
    opts = {
      home = vim.fn.expand("~/org/roam"),

      -- -- Launch panel if nothing is typed after <leader>z
      -- vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>"),
      --
      -- -- Most used functions
      -- vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>"),
      -- vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>"),
      -- vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>"),
      -- vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>"),
      -- vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>"),
      -- vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>"),
      -- vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>"),
      -- vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>"),
      --
      -- -- Call insert link automatically when we start typing a link
      -- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>"),
    },
  },
  -- {
  --   "samgriesemer/vim-roam",
  --   dependencies = {
  --     "skywind3000/asyncrun.vim",
  --   },
  -- },
  {
    "jeffmm/vim-roam",
    config = function()
      vim.g.roam_default_mapping = 1
    end,
    dependencies = {
      {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
          vim.g.mkdp_filetypes = { "markdown" }
        end,
        config = function()
          vim.keymap.set("n", "<Leader>mp", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
        end,
      },
      { -- https://www.reddit.com/r/neovim/comments/1177jak/cant_seem_to_get_vimwiki_custom_paths_to_work/
        "vimwiki/vimwiki",
        -- event = "BufEnter *.md",
        keys = { "<leader>ww", "<leader>wt" },
        init = function()
          vim.g.vimwiki_list = {
            { path = "~/org/roam/", syntax = "markdown", ext = ".md", diary_rel_path = "." },
            -- { path = "", syntax = "markdown", ext = ".md", diary_rel_path = "." },
          }
        end,
        config = function()
          vim.g.vimwiki_global_ext = 0
          vim.g.vimwiki_key_mappings = {
            all_maps = 1,
          }
          vim.g.vimwiki_markdown_link_ext = 1
        end,
      },
      { "junegunn/fzf.vim" },
      {
        "junegunn/fzf",
        run = function()
          vim.fn["fzf#install()"]()
        end,
      },
    },
  },
}
