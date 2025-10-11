local opts = vim.opt

-- Visual options.
opts.termguicolors = true
opts.fillchars = { eob = ' ' }
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
opts.clipboard = "unnamedplus"
opts.winborder = 'rounded'
