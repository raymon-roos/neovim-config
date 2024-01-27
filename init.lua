for _, config in ipairs({
  'core.autocmds',        -- ./lua/core/autocmds.lua
  'core.options',         -- ./lua/core/options.lua
  'core.keybindings',     -- ./lua/core/keybindings.lua
  'lazy_conf',            -- ./lua/lazy_conf.lua
  'zettelkasten',         -- ./lua/zettelkasten.lua
}) do
  local ok, err = pcall(require, config)
  if not ok then
    print(config, ': caused an error', err)
  end
end
