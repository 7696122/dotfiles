return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
    { "leoluz/nvim-dap-go" },
    { "jbyuki/one-small-step-for-vimkind" },
    { "mxsdev/nvim-dap-vscode-js" },
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },
  config = function()
    require("config.dap").setup()
  end,
}
