-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.cmd("language en_US.utf8")

-- of line (?\xB6), at SPACEs (?\xB7) and at TABs (?\xBB).
-- vim.opt.listchars = "tab:> ,trail:-,nbsp:+"
-- vim.opt.listchars = {
--   tab = ">-",
--   trail = "~",
--   nbsp = "+",
--   eol = "$",
--   extends = ">",
--   precedes = "<",
-- }
vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.wrap = true
