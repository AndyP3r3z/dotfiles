return {{
	"neanias/everforest-nvim",
	enabled = true, lazy = false,
	version = false, priority = 1000,
	config = function()
		require("everforest").setup({
			-- config here
			background = "hard", show_eob = false,
			colours_override = function(palette)
				palette.bg0 = "#1e2326"
			end,
		})
	end,
}}
