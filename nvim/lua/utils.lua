local M = {}

--- @param keymaps { mode: string|string[], lhs:string,rhs:string|function ,opts?:vim.keymap.set.Opts}[]
M.keymaps_set = function(keymaps)
  for _, keymap in pairs(keymaps) do
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, keymap.opts)
  end
end

return M
