return {
	"neovim/nvim-lspconfig",
	config = function()
		local util = require("lspconfig.util")

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

		-- Configuración para pylsp: usa .venv si existe en el root del proyecto
		vim.lsp.config("pylsp", {
			root_dir = util.root_pattern("pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git"),
			cmd = { "pylsp" }, -- fallback
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

		-- Habilita servidores (como ya estabas haciendo)
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
