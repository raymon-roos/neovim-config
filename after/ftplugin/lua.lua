local bo = vim.bo
local o = vim.o

bo.tabstop = 2
bo.shiftwidth = 2
bo.expandtab = true

o.foldmethod = 'expr'
o.foldexpr = "getline(v:lnum)=~'^\\s*'.&commentstring[0]"
