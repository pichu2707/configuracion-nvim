return {
	"sudo-tee/opencode.nvim",
	cmd = { "OpenCode", "OpenCodeChat", "OpenCodeToggle", "OpenCodeSend" },
	keys = {
		{ "<leader>oo", "<cmd>OpenCodeToggle<cr>", desc = "Toggle OpenCode" },
		{ "<leader>os", "<cmd>OpenCodeSend<cr>", mode = { "n", "v" }, desc = "Send to OpenCode" },
		{ "<leader>oc", "<cmd>OpenCodeChat<cr>", desc = "OpenCode Chat" },
	},
	opts = {},
}
