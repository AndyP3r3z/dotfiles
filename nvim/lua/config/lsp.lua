-- LSP itself.
vim.lsp.enable({
	"pyright",
	"texlab",
	"tinymist",
	"gopls",
	"qmlls",
	"lua_ls",
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

