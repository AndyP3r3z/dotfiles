require("config.mappings")
require("config.lazy")
require("config.lsp")
require("config.commands")

local opts = vim.opt
-- Visual options
vim.cmd.colorscheme("everforest")
opts.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", {bg = 'none'})
vim.api.nvim_set_hl(0, "NormalNC", {bg = 'none'})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = 'none'})
vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#2E383C", fg="#859289" })
vim.opt.fillchars = { eob = ' ' }
opts.list = true
opts.listchars = {
	tab = "▏ ",
	trail = "·"
}

-- Basic options
opts.number = true
opts.relativenumber = true
opts.cursorline = true
opts.wrap = false
opts.scrolloff = 5
opts.sidescrolloff = 8

-- Indentation options
opts.tabstop = 4
opts.shiftwidth = 4
opts.softtabstop = 4
opts.expandtab = false
opts.smartindent = true
opts.autoindent = true

-- Search options
opts.ignorecase = true
opts.smartcase = true
opts.incsearch = true

-- Other options
opts.undofile = true
opts.completeopt = "fuzzy,menu,popup,noinsert,noselect"
opts.iskeyword:append("-")
opts.path:append("**")
opts.selection = "exclusive"
opts.mouse = 'a'
opts.mousefocus = true
opts.splitright = true
opts.splitbelow = true
vim.g.python_recommended_style = 0
opts.clipboard = "unnamedplus"

vim.cmd([[
  cabbrev <expr> q (getcmdtype() == ':' && getcmdline() ==# 'q') ? 'Q' : 'q'
]]) -- Redirect :q to :Q
