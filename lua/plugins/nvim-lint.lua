return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    -- Configurar linters por tipo de archivo
    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      python = { 'pylint' },
      json = { 'jsonlint' },
      sql = { 'sqlfluff' },
    }

    -- Configurar eslint_d para mejor performance
    local eslint_d = lint.linters.eslint_d
    eslint_d.args = {
      '--no-warn-ignored', -- Reduce warnings
      '--format', 'json',
      '--stdin',
      '--stdin-filename', function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    -- Auto-lint on save y otros eventos
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymaps
    vim.keymap.set('n', '<leader>ll', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })

    vim.keymap.set('n', '<leader>li', function()
      local linters = require('lint').get_running()
      if #linters == 0 then
        print('No linters running')
      else
        print('Running linters: ' .. table.concat(linters, ', '))
      end
    end, { desc = 'Show running linters' })
  end,
}