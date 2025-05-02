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
		require('lspconfig').pyright.setup({handlers = handlers})
		require('lspconfig').texlab.setup({handlers = handlers})
		require('lspconfig').tinymist.setup({handlers = handlers})
	end,
}}
