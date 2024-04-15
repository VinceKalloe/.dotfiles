-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- opt.clipboard:append({ "unnamed", "unnamedplus" })

local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config({
	float = { border = "rounded" }, -- add border to diagnostic popups
})

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
-- opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufEnter", {
-- 	desc = "Open mini.map and exclude some filtypes",
-- 	pattern = { "*" },
-- 	callback = function()
-- 		local exclude_ft = {
-- 			"",
-- 			"nofile",
-- 			"nowrite",
-- 			"quickfix",
-- 			"prompt",
-- 			"terminal",
-- 			"toggleterm",
-- 			"startify",
-- 			"dashboard",
-- 			"alpha",
-- 			"netrw",
-- 			"NvimTree",
-- 			"packer",
-- 			"telescope",
-- 			"lazygit",
-- 			"bufferline",
-- 		}
-- 		local map = require("mini.map")
-- 		if vim.o.buftype == "" and not vim.tbl_contains(exclude_ft, vim.o.filetype) then
-- 			map.open()
-- 		elseif vim.o.buftype == "nofile" and vim.o.filetype == "minimap" then
-- 			return
-- 		else
-- 			vim.b.minimap_disable = true
-- 			map.close()
-- 		end
-- 	end,
-- })
