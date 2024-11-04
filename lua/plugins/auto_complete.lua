return {
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      { 'L3MON4D3/cmp-luasnip-choice', config = true },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-tags',
    },
    opts = function()
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

      local luasnip = require('luasnip')
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      return {
        completion = {
          completeopt = 'menu,menuone,noselect,preview',
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip_choice' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp_document_symbol' },
          { name = 'path' },
        }, {
          {
            name = 'buffer',
            max_item_count = 4,
          },
          { name = 'tags' },
          {
            name = 'spell',
            max_item_count = 3,
            option = { keep_all_entries = false },
            enable_in_context = function()
              local context = require('cmp.config.context')
              return vim.opt.spell
                  and (context.in_treesitter_capture('spell') or context.in_treesitter_capture('comment'))
            end,
          },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, item)
            local kind_icons = {
              Class = "󰠱",
              Color = "󰏘",
              Constant = "󰏿",
              Constructor = "",
              Enum = "",
              EnumMember = "",
              Event = "",
              Field = " ",
              File = "󰈙",
              Folder = "󰉋",
              Function = "󰊕",
              Interface = "",
              Keyword = "󰌋",
              Method = "󰆧",
              Misc = " ",
              Module = "",
              Operator = "󰆕",
              Property = "󰜢",
              Reference = "",
              Snippet = "",
              Struct = "",
              Text = "",
              TypeParameter = " ",
              Unit = "",
              Value = "󰎠",
              Variable = "󰀫",
            }

            if kind_icons[item.kind] then
              item.kind = kind_icons[item.kind] .. item.kind
            end

            item.menu = ({
              nvim_lsp = '[LSP]',
              nvim_lua = '[nvim_lua]',
              luasnip = '[snip]',
              luasnip_choice = '[choice]',
              buffer = '[buf]',
              path = '[path]',
              spell = '[spell]',
            })[entry.source.name]

            return item
          end,
        },
        experimental = {
          ghost_text = { hl_group = 'CmpGhostText' },
        },
        sorting = defaults.sorting,
      }
    end,
    ---@param opts cmp.ConfigSchema
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end

      local cmp = require('cmp')
      cmp.setup(opts)

      -- Insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' },
        }, {
          { name = 'buffer' },
        }),
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        }),
      })
    end,
  },

  { -- snippets
    'L3MON4D3/LuaSnip',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      {
        'nvim-cmp',
        dependencies = {
          'saadparwaiz1/cmp_luasnip',
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = 'luasnip' })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
  },
}
