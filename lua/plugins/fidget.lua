return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = function()
		-- Colores estilo gentleman-kanagawa-blur
		vim.api.nvim_set_hl(0, "FidgetTitle", { fg = "#7FB4CA", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FidgetTask", { fg = "#B7CC85", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FidgetProgress", { fg = "#E0C15A", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FidgetDone", { fg = "#7AA89F", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FidgetIcon", { fg = "#E0C15A", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FidgetNormal", { fg = "#F3F6F9", bg = "NONE" })

		require("fidget").setup({
			progress = {
				poll_rate = 0,
				suppress_on_insert = true,
				ignore_done_already = false,
				ignore_empty_message = false,
				display = {
					render_limit = 16,
					done_ttl = 3,
					done_icon = "",
					done_style = "FidgetDone",
					progress_ttl = math.huge,
					progress_icon = { pattern = "dots", period = 1 },
					progress_style = "FidgetProgress",
					group_style = "FidgetTitle",
					icon_style = "FidgetIcon",
					priority = 30,
					skip_history = true,
				},
			},
			notification = {
				poll_rate = 10,
				filter = vim.log.levels.INFO,
				history_size = 128,
				override_vim_notify = false,
				view = {
					stack_upwards = true,
					icon_separator = " ",
					group_separator = "---",
					group_separator_hl = "Comment",
				},
				window = {
					normal_hl = "FidgetNormal",
					winblend = 0,
					border = "none",
					zindex = 45,
					max_width = 0,
					max_height = 0,
					x_padding = 1,
					y_padding = 0,
					align = "bottom",
					relative = "editor",
				},
			},
		})
	end,
}
