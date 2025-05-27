local bo = vim.bo
local wo = vim.wo

bo.textwidth = 72         -- Automaticly hardbreak sentences at 72 characters, as long as
bo.fo = vim.bo.fo .. 'wa' -- there are trailing spaces. Period without space denotes new paragraph.
bo.fileformat = 'dos'     -- \r\n / CRLF is part of the email spec
wo.spell = true
bo.spelllang = 'en_gb,nl'
