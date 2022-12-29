for _, config in ipairs({
   'plugins.ts.treesitter',
   'plugins.ts.ts_textobs',
}) do
  local ok, err = pcall(require, config)
  if not ok then
    print(config, ': caused an error', err)
  end
end
