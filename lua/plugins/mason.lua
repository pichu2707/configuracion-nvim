return {
	{
		"mason-org/mason.nvim",
		opts = {
			PATH = "prepend", -- Prepend Mason's bin to PATH
			pip = {
				upgrade_pip = true,
			},
		},
		config = function(_, opts)
			-- Force Mason to use system Python instead of uv's Python
			vim.env.PATH = "/usr/bin:" .. vim.env.PATH
			require("mason").setup(opts)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP Servers
					"typescript-language-server", -- ts_ls
					"python-lsp-server", -- pylsp
					"stylua",
					"html-lsp", -- html
					"css-lsp", -- cssls
					"emmet-language-server", -- emmet_language_server
					"sqlls", -- SQL LSP
					"astro-language-server", -- astro
					"tailwindcss-language-server", -- Tailwind CSS

					-- Formatters
					"biome", -- JS/TS/JSON
					"prettier", -- JS/TS/HTML/CSS/JSON/etc
					"black", -- Python
					"isort", -- Python imports
					"pyright",
					"stylua", -- Lua
					"sql-formatter", -- SQL
					"djlint", -- Django/Jinja templates

					-- Linters
					"eslint_d", -- JS/TS
					"pylint", -- Python
					"jsonlint", -- JSON
					"sqlfluff", -- SQL
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
