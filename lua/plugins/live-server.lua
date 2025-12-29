return {
  'barrett-ruth/live-server.nvim',
  build = 'npm install -g live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  config = function()
    require('live-server').setup({
      args = { '--port=8080', '--browser=default' }
    })

    -- Keymaps
    vim.keymap.set('n', '<leader>ls', ':LiveServerStart<CR>', { desc = 'Start live server' })
    vim.keymap.set('n', '<leader>lx', ':LiveServerStop<CR>', { desc = 'Stop live server' })
  end,
}