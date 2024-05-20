for _, config in ipairs({
  'core.autocmds',
  'core.options',
  'core.keybindings',
  'lazy_conf',
  'zettelkasten',
}) do
  local ok, err = pcall(require, config)
  if not ok then
    print(config, ': caused an error', err)
  end
end
