require("config.mappings")
require("config.lazy")

-- Colors
vim.cmd.colorscheme("everforest")

local options = {
	termguicolors = true -- Enables 24-bit RGB color
}

vim.api.nvim_set_hl(0, "StatusLine", { bg="#a7c080", fg="#1e2326" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg="#374145", fg="#859289" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#2E383C", fg="#859289" })

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

-- Prompt to save when trying to quit with unsaved changes
vim.api.nvim_create_user_command("Q", function(opts)
	-- Check `!` option
	if opts.bang then
		vim.cmd("q!") -- Quit without saving
		return
	end

	if vim.bo.modified then
		local answer = vim.fn.confirm("You have unsaved changes. Do you want to save?", "&Yes\n&No\n&Cancel", 1)
		if answer == 1 or answer == 121 then
			vim.cmd("x")  -- Save before quitting
		end
		if answer == 2 or answer == 110 then
			vim.cmd("q!")  -- Quit without saving
		end
		return
	end
	vim.cmd("q") -- Quit if no changes
end, {bang = true})

vim.cmd("cabbrev q Q") -- Redirect :q to :Q

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
