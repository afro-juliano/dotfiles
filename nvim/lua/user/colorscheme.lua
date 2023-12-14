-- This is the darkplus theme
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- This is for making the telescope transparent
vim.cmd([[au VimEnter * highlight TelescopeNormal guibg=none]])
vim.cmd([[au VimEnter * highlight TelescopeBorder guibg=none]])
