return {
	-- Icons
	{
		enabled = true,
		'echasnovski/mini.icons', version = false,
		config = function()
			require('mini.icons').setup()
		end,
	},
	-- Completion
	{
		enabled = true,
		'echasnovski/mini.completion', version = false,
		config = function()
			require('mini.completion').setup()
		end,
	},
	-- Move
	{
		enabled = true,
		'echasnovski/mini.move', version = false,
		config = function()
			require('mini.move').setup()
		end,
	},
}
