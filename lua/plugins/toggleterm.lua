return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    })

    -- Terminal específico para tmux
    local Terminal = require('toggleterm.terminal').Terminal
    local tmux = Terminal:new({
      cmd = "tmux new-session -A -s neovim",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
    })

    function _TMUX_TOGGLE()
      tmux:toggle()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle floating terminal" })
    vim.keymap.set("n", "<leader>tx", "<cmd>lua _TMUX_TOGGLE()<CR>", { desc = "Toggle tmux session" })
    vim.keymap.set("n", "<leader>tq", "<cmd>ToggleTerm<cr>", { desc = "Close terminal" })

    -- Terminal mode shortcuts
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Close terminal from terminal mode" })
    vim.keymap.set("t", "<C-q>", "<cmd>ToggleTerm<cr>", { desc = "Close terminal (Ctrl+Q)" })

    -- Navigation in terminal mode
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal left" })
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal down" })
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal up" })
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal right" })
  end,
}