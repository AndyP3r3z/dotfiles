-- Wrap arrows to previous and next lines

local keymap = vim.keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.opt.whichwrap:append {
	['h'] = true,
	['l'] = true,
	['<'] = true,
	['>'] = true,
	['['] = true,
	[']'] = true,
}

-- Undo with U
keymap.set('n', 'U', '<C-r>', { noremap = true })

-- Use `<Tab>` and `<S-Tab>` for navigation through completion list
local imap_expr = function(lhs, rhs)
	keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Change window focus.
keymap.set('n', '<C-h>', '<C-w>h', options)
keymap.set('n', '<C-j>', '<C-w>j', options)
keymap.set('n', '<C-k>', '<C-w>k', options)
keymap.set('n', '<C-l>', '<C-w>l', options)
