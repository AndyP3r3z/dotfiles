require("config.mappings")
require("config.lazy")
require("config.lsp")
require("config.commands")
require("config.options")

vim.cmd.colorscheme("everforest")
vim.api.nvim_set_hl(0, "Normal", {bg = 'none'})
vim.api.nvim_set_hl(0, "NormalNC", {bg = 'none'})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = 'none'})
vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#2E383C", fg="#859289" })
vim.g.python_recommended_style = 0

vim.cmd([[
  cabbrev <expr> q (getcmdtype() == ':' && getcmdline() ==# 'q') ? 'Q' : 'q'
]]) -- Redirect :q to :Q
