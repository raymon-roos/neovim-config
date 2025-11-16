return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  opts = function()
    -- user commands to toggle format-on-save
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        vim.g.disable_autoformat = true
      else
        vim.b.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })

    return {
      formatters_by_ft = {
        blade = { 'blade-formatter' },
        css = { 'prettier' },
        go = { 'golangci-lint', 'gofumpt', stop_after_first = true, },
        html = { 'prettier' },
        hurl = { 'hurlfmt' },
        javascript = { 'biome', 'eslint_d', 'prettier', stop_after_first = true, },
        json = { 'prettier' },
        latex = { 'latexindent' },
        markdown = { 'prettier' },
        nix = { 'alejandra' },
        php = { 'phpcbf' },
        python = { 'ruff' },
        rust = { 'rustfmt' },
        sh = { 'shellcheck', 'shellharden', 'shfmt' },
        typst = { 'typstyle' },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match('/node_modules/') or bufname:match('/vendor/') then
          return
        end

        return { timeout_ms = 400, lsp_fallback = true }
      end,
    }
  end,
}
