return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = function()
		require('nvim-autopairs').setup({
			check_ts = true,              -- usa treesitter para detectar pares
			ts_config = {
				lua = {'string'},           -- no añade pares en nodos de string de lua
				javascript = {'template_string'},
				python = {'string'},        -- no añade pares en strings de python
			},

			-- Archivos donde NO activar autopairs
			disable_filetype = { "TelescopePrompt", "vim" },

			-- Comportamiento general
			disable_in_macro = false,            -- funciona en macros
			disable_in_visualblock = false,      -- funciona en visual block
			disable_in_replace_mode = true,      -- NO funciona en replace mode
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- ignora si hay estos caracteres después

			-- Funcionalidades habilitadas
			enable_moveright = true,             -- Tab o ) mueve cursor a la derecha
			enable_afterquote = true,            -- permite pares después de comillas
			enable_check_bracket_line = true,    -- verifica si ya existe cierre en la línea
			enable_bracket_in_quote = true,      -- permite () dentro de strings

			-- Atajos útiles
			map_cr = true,                       -- Enter formatea entre {}
			map_bs = true,                       -- Backspace borra ambos caracteres
			map_c_h = false,                     -- Ctrl+h NO borra pares
			map_c_w = false,                     -- Ctrl+w comportamiento normal

			fast_wrap = {
				map = '<M-e>',                     -- Alt+e para envolver selección
				chars = { '{', '[', '(', '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = '$',
				keys = 'qwertyuiopzxcvbnmasdfghjkl',
				check_comma = true,
				highlight = 'Search',
				highlight_grey='Comment'
			},
		})

	end,
}
