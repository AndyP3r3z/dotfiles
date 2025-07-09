return {{
	"okuuva/auto-save.nvim",
	version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		condition = function(_)
			local ft = vim.bo.filetype
			return ft == "markdown" or ft == "typst" or ft == "latex" or ft == "asciidoc"
		end,
	},
}}
