-- Wrap arrows to previous and next lines
vim.g.mapleader = " "
vim.opt.whichwrap:append {
	['h'] = true,
	['l'] = true,
	['<'] = true,
	['>'] = true,
	['['] = true,
	[']'] = true,
}

-- Map <C-c> to copy selected text to the clipboard in Visual Mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
-- Undo with U
vim.keymap.set('n', 'U', '<C-r>', { noremap = true })
