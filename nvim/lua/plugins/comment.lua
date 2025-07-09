return {{
	enabled = true,
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			toggler = {
				line = "<C-_>",
				block = "<F40>",
			},
			opleader = {
				line = "<C-_>",
				block = "<F40>",
			},
			mappings = {
				basic = true,
				extra = true,
			}
		})
	end,
}}
