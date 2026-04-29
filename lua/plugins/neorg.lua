return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neorg/lua-utils.nvim",
		"pysan3/pathlib.nvim",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notas",
					},
					default_workspace = "notes",
				},
			},
		},
	},
}
