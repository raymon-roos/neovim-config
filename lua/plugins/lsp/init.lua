for _, config in ipairs({
  'plugins.lsp.mason',
  'plugins.lsp.lsp_appearance',
  'plugins.lsp.lsp_config',
  'plugins.lsp.null_ls',
}) do
  local ok, err = pcall(require, config)
  if not ok then
    print(config, ': caused an error', err)
  end
end
