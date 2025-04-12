return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = '*',
    opts = {
      keymap = { preset = 'enter' },

      appearance = {
        use_nvim_cmp_as_default = true,
      },

      completion = {
        menu = {
          max_height = 20,
          border = 'rounded',
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            max_width = 65,
            max_height = 30,
            border = 'rounded',
          },
        },
      },

      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'orgmode' },
        -- cmdline = {},
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            -- score_offset = 100,
          },
          orgmode = {
            name = 'Orgmode',
            module = 'orgmode.org.autocompletion.blink',
          },
        },
      },

      signature = {
        enabled = true,
        window = { border = 'rounded' }
      },
    },
    opts_extend = { 'sources.default' }
  },
}
