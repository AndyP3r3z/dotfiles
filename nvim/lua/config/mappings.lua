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

-- Open the Config folder with <C-,>.
keymap.set('n', '<C-,>', ':e ~/.config/nvim<CR>')

-- Undo with U
keymap.set('n', 'U', '<C-r>', { noremap = true })

-- Visual stay in indent mode.
keymap.set('v', "<", "<gv", options)
keymap.set('v', ">", ">gv", options)
keymap.set('v', '<BS>', '<Del>')

-- Scrolling and centering when searching.
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

-- Insert mode mappings.
keymap.set('i', '<C-BS>', '<C-o>db')
keymap.set('i', '<C-Del>', '<C-o>dw')

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
keymap.set("n", "<C-Up>", ":resize +2<CR>", options)
keymap.set("n", "<C-Down>", ":resize -2<CR>", options)
keymap.set("n", "<C-Left>", ":vertical resize -13<CR>", options)
keymap.set("n", "<C-Right>", ":vertical resize +13<CR>", options)
