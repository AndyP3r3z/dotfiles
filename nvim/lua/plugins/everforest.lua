return {{
	"neanias/everforest-nvim",
	enabled = true, lazy = false,
	version = false, priority = 1000,
	config = function()
		require("everforest").setup({
			background = "hard",
		})
	end,
}}
