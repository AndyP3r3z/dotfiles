return {{
	"neovim/nvim-lspconfig",
	config = function()
		-- local border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
		-- local handlers = {
		-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
		-- 	["textDocument/signatureHelp"] = vim.lsp.with(
		-- 		vim.lsp.handlers.signature_help,
		-- 		{border = border, title = "Signature"}),
		-- }
		-- vim.diagnostic.config({float = {border = border}})
		require('lspconfig').pyright.setup({})
		require('lspconfig').texlab.setup({})
		require('lspconfig').tinymist.setup({})
		require('lspconfig').gopls.setup({})
		require('lspconfig').qmlls.setup({cmd = {"qmlls", "-E"}})
	end,
}}
