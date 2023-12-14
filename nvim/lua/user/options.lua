local o=vim.o
local bo=vim.bo
local wo=vim.wo

o.ruler = false
o.splitright = true
o.splitbelow = true
o.ignorecase = true
o.hlsearch = true
o.mouse='a'
o.updatetime = 400
o.background = 'dark'
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.incsearch = true
o.hidden = true
o.scrolloff = 8
o.sidescrolloff = 8
o.completeopt = "menuone,noselect,noinsert"
o.shortmess = o.shortmess .. 'c'
o.showmode = false

o.tabstop = 2
bo.tabstop = 2
o.softtabstop = 2
bo.softtabstop = 2
o.shiftwidth = 2
bo.shiftwidth = 2
o.autoindent = true
bo.autoindent = true
o.expandtab = true
bo.expandtab = true

wo.number = true
wo.relativenumber = false
wo.signcolumn = 'number'
wo.wrap = false

vim.g.python3_host_prog="/usr/local/bin/python3"

wo.list = true

-- autoindent vim airline
local settab = vim.opt

--settab.cursorline = true
settab.autoindent = true
settab.autowrite = true
