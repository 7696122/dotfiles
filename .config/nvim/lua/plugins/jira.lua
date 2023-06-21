return {
  {
    "Arekkusuva/jira-nvim",
    enabled = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "folke/which-key.nvim",
    },
    build = "make build",
    config = function()
      require("jira-nvim").setup({
        host = "https://jira.lfcorp.com",
        token_path = "~/.config/jira-nvim/token.txt",
      })
      require("which-key").register({
        j = {
          name = "Jira",
          t = { "<cmd>JiraQuery project = <your_project> and status = 'To Do'<cr>", "To Do" },
          p = { "<cmd>JiraQuery project = <your_project> and status = 'In Progress'<cr>", "In Progress" },
          d = { "<cmd>JiraQuery project = <your_project> and status = 'Done'<cr>", "Done" },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
