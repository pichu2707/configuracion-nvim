return {
	"akinsho/bufferline.nvim",
	enabled = false, -- Usando lualine tabline en su lugar
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- buffers or tabs
				style_preset = require("bufferline").style_preset.default,
				themable = true,
				numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both"
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎",
					style = "icon", -- "icon" | "underline" | "none"
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,
				diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icons = {
						error = " ",
						warning = " ",
						hint = " ",
						info = " ",
					}
					local result = ""
					for name, c in pairs(diagnostics_dict) do
						if icons[name] then
							result = result .. icons[name] .. c .. " "
						end
					end
					return vim.trim(result)
				end,
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				persist_buffer_sort = true,
				move_wraps_at_ends = false,
				separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { "|", "|" }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current",
				groups = {
					options = {
						toggle_hidden_on_enter = true,
					},
					items = {
						{
							name = "Tests",
							highlight = { underline = true, sp = "blue" },
							priority = 2,
							matcher = function(buf)
								return buf.filename:match("%.test") or buf.filename:match("%.spec")
							end,
						},
						{
							name = "Docs",
							highlight = { undercurl = true, sp = "green" },
							auto_close = false,
							matcher = function(buf)
								return buf.filename:match("%.md") or buf.filename:match("%.txt")
							end,
						},
					},
				},
			},
			highlights = {
				fill = {
					bg = { attribute = "bg", highlight = "TabLineFill" },
				},
				background = {
					italic = true,
				},
				buffer_selected = {
					bold = true,
					italic = false,
				},
				diagnostic_selected = {
					bold = true,
				},
				error_selected = {
					bold = true,
				},
				warning_selected = {
					bold = true,
				},
				info_selected = {
					bold = true,
				},
				hint_selected = {
					bold = true,
				},
				separator_selected = {
					fg = { attribute = "bg", highlight = "TabLineFill" },
				},
				separator_visible = {
					fg = { attribute = "bg", highlight = "TabLineFill" },
				},
				separator = {
					fg = { attribute = "bg", highlight = "TabLineFill" },
				},
			},
		})
	end,
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin buffer" },
		{ "<leader>bc", "<cmd>bdelete<CR>", desc = "Close buffer" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
		{ "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
		{ "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
		{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
		{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
		{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
		{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
		{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
		{ "<leader>tn", "<cmd>tabnew<CR>", desc = "New tab" },
		{ "<leader>tc", "<cmd>tabclose<CR>", desc = "Close tab" },
		{ "<leader>]t", "<cmd>tabnext<CR>", desc = "Next tab" },
		{ "<leader>[t", "<cmd>tabprevious<CR>", desc = "Previous tab" },
	},
}
