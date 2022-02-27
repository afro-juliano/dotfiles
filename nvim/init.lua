-- Requires from files needed to work
require('packages')
require('config')
require('colorscheme')
require('nv-cmp.cmp')
require('keybindings')
require('lsp.lsp-ts')
require('lsp.lua-ls')

-- Requires from languages servers
require'lspconfig'.pyright.setup{}
require('bufferline').setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.jdtls.setup {'java-linux-ls'}
require'lspconfig'.cssls.setup{}
require'lspconfig'.eslint.setup{}

