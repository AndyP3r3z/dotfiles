require("config.mappings")
require("config.lazy")
require("config.commands")

-- Colors
vim.cmd.colorscheme("everforest")

local options = {
	termguicolors = true -- Enables 24-bit RGB color
}

vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#2E383C", fg="#859289" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[ vim.diagnostic.severity.ERROR ] = "✘",
			[ vim.diagnostic.severity.WARN ] =  "󱈸",
			[ vim.diagnostic.severity.HINT ] =  "",
			[ vim.diagnostic.severity.INFO ] =  ""
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Other options
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = {
	tab = "▏ ",
	trail = "·"
}
vim.g.python_recommended_style = 0
vim.o.expandtab = false
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

vim.cmd("cabbrev q Q") -- Redirect :q to :Q

