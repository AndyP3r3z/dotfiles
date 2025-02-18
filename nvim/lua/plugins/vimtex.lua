return {{
	"lervag/vimtex",
	enabled = true,
	config = function()
		-- VimTeX configuration
		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_compiler_latexmk = {
			out_dir = './build',
			aux_dir = './aux',
			continuous = 1,
		}
	end,
}}
