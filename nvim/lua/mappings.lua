-- Actually not insane defaults
vim.keymap.set('n', 'h', '<insert>')
vim.keymap.set('n', 'i', '<Up>')
vim.keymap.set('n', 'k', '<Down>')
vim.opt.whichwrap:append("l")
vim.keymap.set('n', 'j', function()
	if vim.fn.col('.') == 1 then
		return 'gk$'
	end
	return 'h'
end, {expr = true, noremap = true})

-- Map <C-c> to copy selected text to the clipboard in Visual Mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map <C-n> to return to Normal Mode from Insert Mode
vim.keymap.set('i', '<C-n>', '<Esc>', { noremap = true, silent = true })

-- AUTO PAIR FUNCTIONS.
local function auto_pair(pair_open, pair_close)
	vim.keymap.set("i", pair_open, function()
		return pair_open .. pair_close .. "<Left>"
	end, { expr = true, noremap = true })
end

-- Auto-close pairs
auto_pair("(", ")")
auto_pair("[", "]")
auto_pair("{", "}")
auto_pair('"', '"')
auto_pair("'", "'")
auto_pair("`", "`")

