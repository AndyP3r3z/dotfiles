return {{
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"c", "lua", "query", "python", "julia", "latex", "comment", "markdown", "markdown_inline"},
			auto_install = false,
			highlight = {enable = true},
		})
	end,
}}
