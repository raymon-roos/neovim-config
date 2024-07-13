local o = vim.o

o.foldmethod = 'expr'
o.foldexpr = "getline(v:lnum)=~'^\\s*'.&commentstring[0]"
o.tabstop = 4
o.expandtab = true
