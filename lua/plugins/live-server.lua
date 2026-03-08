return {
	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	keys = {
		{ "<leader>Ls", "<cmd>LiveServerStart<CR>", desc = "Start live server" },
		{ "<leader>Lx", "<cmd>LiveServerStop<CR>", desc = "Stop live server" },
	},
	config = function()
		require("live-server").setup({
			args = { "--port=8080", "--browser=default" },
		})
	end,
}

