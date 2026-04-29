return {
	"SmiteshP/nvim-navic",
	dependencies = "neovim/nvim-lspconfig",
	opts = {
		lsp = {
			auto_attach = true,
		},
		highlight = true,
		separator = " > ",
		depth_limit = 5,
	},
	config = function(_, opts)
		require("nvim-navic").setup(opts)
		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}
