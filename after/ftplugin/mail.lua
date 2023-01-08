local bo = vim.bo
local wo = vim.wo

bo.textwidth = 78
bo.fo = vim.bo.fo .. "wa"  -- Automaticly hardbreak sentences at 72 characters, as long as there are trailing spaces. Period without space denotes new paragraph.
wo.spell = true
bo.spelllang = 'en_gb,nl'
