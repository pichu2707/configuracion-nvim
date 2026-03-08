return {
	"neovim/nvim-lspconfig",
	config = function()
		local util = require("lspconfig.util")

		-- IMPORTANTE: Obtener capabilities de blink.cmp para el autocompletado
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		-- Configuración de diagnósticos
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				source = "if_many",
			},
			float = {
				source = "always",
				border = "rounded",
				header = "",
				prefix = "",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Configuración optimizada para TypeScript/React
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
					suggest = {
						completeFunctionCalls = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
					suggest = {
						completeFunctionCalls = true,
					},
				},
			},
		})

		-- Configuración para emmet en JSX/TSX
		vim.lsp.config("emmet_language_server", {
			capabilities = capabilities,
			filetypes = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})

		-- Configuración para CSS
		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})

		-- Configuración para HTML
		vim.lsp.config("html", {
			capabilities = capabilities,
		})

		-- Configuración para pylsp: usa .venv si existe en el root del proyecto
		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			root_dir = util.root_pattern("pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git"),
			cmd = { "pylsp" },
			on_new_config = function(new_config, root_dir)
				local venv_pylsp = root_dir .. "/.venv/bin/pylsp"
				if vim.fn.executable(venv_pylsp) == 1 then
					new_config.cmd = { venv_pylsp }
				end
			end,
			settings = {
				pylsp = {
					plugins = {
						jedi = {
							extra_paths = { "src" },
						},
					},
				},
			},
		})

		-- Configuración para Astro
		vim.lsp.config("astro", {
			capabilities = capabilities,
		})

		-- Configuración para SQL
		vim.lsp.config("sqlls", {
			capabilities = capabilities,
		})

		-- Configuración para Markdown
		vim.lsp.config("markdown_oxide", {
			capabilities = capabilities,
		})

		-- Habilita todos los servidores
		vim.lsp.enable({
			"ts_ls",
			"pylsp",
			"astro",
			"cssls",
			"html",
			"emmet_language_server",
			"sqlls",
			"markdown_oxide",
		})
	end,
}
