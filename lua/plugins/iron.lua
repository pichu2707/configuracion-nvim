return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require('iron.core')

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          javascript = {
            command = {"node"}
          },
          python = {
            command = {"python3"}
          },
          typescript = {
            command = {"ts-node"}
          }
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require('iron.view').right(50),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to your config
      keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_mark = "<space>sm",
        send_paragraph = "<space>sp",
        send_until_cursor = "<space>su",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }

    -- Custom keymaps para JavaScript específicamente
    vim.keymap.set('n', '<leader>js', ':IronRepl javascript<CR>', { desc = 'Start JavaScript REPL' })
    vim.keymap.set('n', '<leader>py', ':IronRepl python<CR>', { desc = 'Start Python REPL' })
    vim.keymap.set('n', '<leader>ts', ':IronRepl typescript<CR>', { desc = 'Start TypeScript REPL' })
    vim.keymap.set('n', '<leader>ir', ':IronRestart<CR>', { desc = 'Restart REPL' })
    vim.keymap.set('n', '<leader>ih', ':IronHide<CR>', { desc = 'Hide REPL' })
  end,
}