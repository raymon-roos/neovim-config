local util = require('lspconfig.util')

local bin_name = 'intelephense'
local cmd = { bin_name, '--stdio' }

return {
    cmd = cmd,
    filetypes = { 'php' },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('composer.json', '.git', 'index.php', pattern)

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
	  maxSize = 10000,
	},
	telemetry = {
	  enabled = false,
	},
      },
    }
  }
