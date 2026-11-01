vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.undofile = true
opt.timeoutlen = 500
opt.updatetime = 250
opt.swapfile = false
opt.confirm = true
opt.ignorecase = true
opt.smartcase = true

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank() end,
})
