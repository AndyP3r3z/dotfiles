-- Actually not insane defaults
vim.keymap.set('n', 'h', '<insert>')
vim.keymap.set('n', 'i', '<Up>')
vim.keymap.set('n', 'k', '<Down>')
vim.keymap.set('n', 'j', '<Left>')

-- Map <C-c> to copy selected text to the clipboard in Visual Mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map <C-n> to return to Normal Mode from Insert Mode
vim.keymap.set('i', '<C-n>', '<Esc>', { noremap = true, silent = true })

