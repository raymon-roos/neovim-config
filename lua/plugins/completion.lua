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
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = {
          max_height = 20,
          border = 'rounded',
        },
        list = {
          selection = 'manual',
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
        default = { 'lsp', 'path', 'snippets', 'buffer', 'orgmode' },
        -- cmdline = {},
        providers = {
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
    opts_extend = { "sources.default" }
  },
}
