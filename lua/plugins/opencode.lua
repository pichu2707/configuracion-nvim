return {
	"sudo-tee/opencode.nvim",
	cmd = { "OpenCode", "OpenCodeChat", "OpenCodeToggle", "OpenCodeSend" },
	keys = {
		{ "<leader>oo", "<cmd>OpenCodeToggle<cr>", desc = "Toggle OpenCode" },
		{ "<leader>os", "<cmd>OpenCodeSend<cr>", mode = { "n", "v" }, desc = "Send to OpenCode" },
		{ "<leader>oc", "<cmd>OpenCodeChat<cr>", desc = "OpenCode Chat" },
	},
	opts = {
		keymap = {
			output_window = {
				-- <tab> por defecto llama toggle_pane que rompe con winfixbuf (E1513)
				-- Se mueve a <C-Tab> para no colisionar con navegación de buffers
				['<tab>'] = false,
				['<C-Tab>'] = { 'toggle_pane', mode = { 'n' }, desc = 'Toggle input/output panes' },
			},
			input_window = {
				['<tab>'] = false,
				['<C-Tab>'] = { 'toggle_pane', mode = { 'n' }, desc = 'Toggle input/output panes', defer_to_completion = true },
			},
		},
	},
}
