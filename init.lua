for _, config in ipairs({
  'core.autocmds',        -- ./lua/core/autocmds.lua
  'plugins.packer',       -- ./lua/plugins/packer/init.lua
  'core.options',         -- ./lua/core/options.lua
  'plugins.zettelkasten', -- ./lua/plugins/zettelkasten.lua
  'core.keybindings',     -- ./lua/core/keybindings
}) do
  local ok, err = pcall(require, config)
  if not ok then
    print(config, ': caused an error', err)
  end
end
