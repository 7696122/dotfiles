-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.cmd("language en_US.utf8")

-- of line (?\xB6), at SPACEs (?\xB7) and at TABs (?\xBB).
-- vim.opt.listchars = "tab:> ,trail:-,nbsp:+"
vim.opt.listchars = {
  tab = ">-",
  trail = "~",
  nbsp = "+",
  eol = "$",
  -- extends = ">",
  -- precedes = "<",
}
