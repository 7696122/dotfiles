return {
  {
    "Furkanzmc/zettelkasten.nvim",
    opts = {
      notes_path = "~/dotfiles",
    },
  },
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "renerocksai/calendar-vim" },
      { "mzlogin/vim-markdown-toc" },
      { "cnshsliu/synctodo", build = "brew install keith/formulae/reminders-cli" },
    },
    config = function()
      -- https://github.com/renerocksai/telekasten.nvim/issues/233
      local home = vim.fn.expand("~/zettelkasten")

      require("telekasten").setup({
        home = home,
        dailies = home .. "/" .. "daily",
        weeklies = home .. "/" .. "weekly",
        templates = home .. "/" .. "templates",
        image_subdir = "img",
        new_note_filename = "uuid",
        follow_creates_nonexisting = true,
        dailies_create_nonexisting = true,
        weeklies_create_nonexisting = true,

        template_handling = "smart",
        new_note_location = "smart",

        media_previewer = "telescope-media-files",

        plug_into_calendar = true,
        calendar_opts = {
          -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
          weeknm = 4,
          -- use monday as first day of week: 1 .. true, 0 .. false
          calendar_monday = 1,
          -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
          calendar_mark = "left-fit",
        },
        -- -- -- For daily notes:
        -- --   - |telekasten.settings.template_new_daily|
        -- dailies_create_nonexisting = true,
        -- --
        -- --   -- For weekly notes:
        -- --   - |telekasten.settings.template_new_weekly|
        -- weeklies_create_nonexisting = true,
        -- --
        -- --   -- For all other notes:
        -- --   - |telekasten.settings.template_new_note|
        -- follow_creates_nonexisting = true,
        -- template_new_daily = "",
        -- template_new_weekly = "",
        -- Launch panel if nothing is typed after <leader>z
        vim.keymap.set("n", "<leader>Z", "<cmd>Telekasten panel<CR>"),

        -- Most used functions
        vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>"),
        vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>"),
        vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>"),
        vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>"),
        vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>"),
        vim.keymap.set("n", "<leader>zN", "<cmd>Telekasten new_templated_note<CR>"),
        vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>"),
        vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>"),
        vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>"),

        -- Call insert link automatically when we start typing a link
        vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>"),
      })
    end,
  },
  --   {
  --     "mickael-menu/zk-nvim",
  --     config = function()
  --       require("zk").setup({
  --         -- See Setup section below
  --       })
  --     end,
  --   },
  --   -- {
  --   --   "samgriesemer/vim-roam",
  --   --   dependencies = {
  --   --     "skywind3000/asyncrun.vim",
  --   --   },
  --   -- },
  --   {
  --     "jeffmm/vim-roam",
  --     config = function()
  --       vim.g.roam_default_mapping = 1
  --     end,
  --     dependencies = {
  --       {
  --         "iamcco/markdown-preview.nvim",
  --         build = "cd app && npm install",
  --         init = function()
  --           vim.g.mkdp_filetypes = { "markdown" }
  --         end,
  --         config = function()
  --           vim.keymap.set("n", "<Leader>mp", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
  --         end,
  --       },
  --       { -- https://www.reddit.com/r/neovim/comments/1177jak/cant_seem_to_get_vimwiki_custom_paths_to_work/
  --         "vimwiki/vimwiki",
  --         -- event = "BufEnter *.md",
  --         keys = { "<leader>ww", "<leader>wt" },
  --         init = function()
  --           vim.g.vimwiki_list = {
  --             { path = "~/org/roam/", syntax = "markdown", ext = ".md", diary_rel_path = "." },
  --             -- { path = "", syntax = "markdown", ext = ".md", diary_rel_path = "." },
  --           }
  --         end,
  --         config = function()
  --           vim.g.vimwiki_global_ext = 0
  --           vim.g.vimwiki_key_mappings = {
  --             all_maps = 1,
  --           }
  --           vim.g.vimwiki_markdown_link_ext = 1
  --         end,
  --       },
  --       { "junegunn/fzf.vim" },
  --       {
  --         "junegunn/fzf",
  --         run = function()
  --           vim.fn["fzf#install()"]()
  --         end,
  --       },
  --     },
  --   },
}
