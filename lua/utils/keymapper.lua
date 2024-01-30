local keymapper = {}

--- Functional wrapper for mapping custom keybindings
--- Bind rhs action to lhs mapping for all modes, applying
--- norecurse, silent and optionally any aditional opts
--- @param modes table|string
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.map(modes, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(modes, lhs, rhs, options)
end

--- map key in visual mode only
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.vmap(lhs, rhs, opts)
  keymapper.map('v', lhs, rhs, opts)
end

--- map key in normal mode only
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.nmap(lhs, rhs, opts)
  keymapper.map('n', lhs, rhs, opts)
end

--- map key in insert mode only
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.imap(lhs, rhs, opts)
  keymapper.map('i', lhs, rhs, opts)
end

--- map key in command mode only
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.cmap(lhs, rhs, opts)
  keymapper.map('c', lhs, rhs, opts)
end

--- map key in terminal mode only
--- @param lhs string
--- @param rhs string|function
--- @param opts table?
--- @return nil
function keymapper.tmap(lhs, rhs, opts)
  keymapper.map('t', lhs, rhs, opts)
end

return keymapper
