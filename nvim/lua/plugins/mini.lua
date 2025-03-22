return {
	-- Icons
	{
		enabled = true,
		'echasnovski/mini.icons', version = '*',
		config = function()
			require('mini.icons').setup()
		end,
	},
	-- Completion
	{
		enabled = true,
		'echasnovski/mini.completion', version = '*',
		config = function()
			require('mini.completion').setup()
		end,
	},
	-- Move
	{
		enabled = true,
		'echasnovski/mini.move', version = '*',
		config = function()
			require('mini.move').setup()
		end,
	},
	-- Surround
	{
		enabled = true,
		'echasnovski/mini.surround', version = '*',
		config = function()
			require('mini.surround').setup()
		end,
	},
}
