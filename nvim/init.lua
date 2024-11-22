require("everforest")
require("mappings")

vim.g.everforest_colors_override = { ["bg0"] = { "#1e2326", "235" } }
vim.g.everforest_background = "hard"
vim.cmd.colorscheme("everforest")

local options = {
    termguicolors = true -- Enables 24-bit RGB color
}

