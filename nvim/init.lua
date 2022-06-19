-- Requires from files needed to work
require("packages")
require("config")
require("colorscheme")
require("nv-cmp")
require("keybindings")
require("gps")
require("lsp")
require("autopairs")
require("treesitter")
require("debug")
require("illuminate-me")
require("telescope")
require("lualine").setup{}
require("nvim-tree").setup{}
require("bufferline").setup{}

-- Requires from languages servers
require("lspconfig").jdtls.setup {'java-linux-ls'}
