return {{
	enabled=true,
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup({
		options = {
			component_separators = {left = "", right = ""},
			section_separators = {left = "", right = ""},
			sections = {
				lualine_c = {
					'filename',
					{
						function()
							return tostring(vim.fn.wordcount().words) .. " words"
						end,
						cond = function()
							local ft = vim.bo.filetype
							return ft == "markdown" or ft == "typst" or ft == "latex" or ft == "asciidoc"
						end,
					},
				}
			}
		}
	})
	end,
}}
