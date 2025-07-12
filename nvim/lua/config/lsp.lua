-- LSP itself.
vim.lsp.enable({
	"pyright",
	"texlab",
	"tinymist",
	"gopls",
	"qmlls",
	"lua_ls",
})

-- Disable go formatting.
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		-- Unset 'formatexpr'
		-- vim.bo[args.buf].formatexpr = nil
		vim.opt.formatprg = ''
		-- Unset 'omnifunc'
		-- vim.bo[args.buf].omnifunc = nil
		-- Unmap K
		-- vim.keymap.del('n', 'K', { buffer = args.buf })
	end,
})

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = { current_line = true },
	signs = {
		text = {
			[ vim.diagnostic.severity.ERROR ] = "✘",
			[ vim.diagnostic.severity.WARN ] =  "󱈸",
			[ vim.diagnostic.severity.HINT ] =  "",
			[ vim.diagnostic.severity.INFO ] =  ""
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

