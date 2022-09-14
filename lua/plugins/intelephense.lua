local util = require('lspconfig.util')

return {
    cmd =  'intelephense --stdio' ,
    filetypes = { 'php' },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('composer.json', '.git', pattern)

      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root
    end,
    init_options = {
      storagePath = "/tmp/",
      globalStoragePath = vim.fn.expand("$XDG_STATE_HOME") .."/intelephense",
    },
    settings = {
      intelephense = {
	files = {
	  maxSize = 1000000, -- In bytes
	},
	telemetry = {
	  enabled = false,
	},
      },
    }
  }
