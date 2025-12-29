return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP Servers
					"typescript-language-server", -- ts_ls
					"python-lsp-server",          -- pylsp
					"html-lsp",                   -- html
					"css-lsp",                    -- cssls
					"emmet-language-server",      -- emmet_language_server
					"sqlls",                      -- SQL LSP
					"astro-language-server",      -- astro

					-- Formatters
					"biome",        -- JS/TS/JSON
					"prettier",     -- JS/TS/HTML/CSS/JSON/etc
					"black",        -- Python
					"isort",        -- Python imports
					"stylua",       -- Lua
					"sql-formatter", -- SQL

					-- Linters
					"eslint_d",  -- JS/TS
					"pylint",    -- Python
					"jsonlint",  -- JSON
					"sqlfluff",  -- SQL
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
