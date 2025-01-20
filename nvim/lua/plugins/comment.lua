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
				line = "<F40>",
				block = "<C-_>",
			},
		})
	end,
}}
