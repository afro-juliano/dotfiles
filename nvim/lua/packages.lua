local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0  then
   execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
   execute 'packadd packer.nvim'
end

-- General requires for general plugins
require('packer').startup(function(use)
  use "akinsho/bufferline.nvim"
  use "nvim-lua/popup.nvim"
  use "wbthomason/packer.nvim"
  use "tomasr/molokai"
  use "nvim-lua/plenary.nvim"
  use "lunarvim/colorschemes"
  use "folke/tokyonight.nvim"
  use "hrsh7th/vim-vsnip"
  use "knubie/vim-kitty-navigator"
  use "mfussenegger/nvim-jdtls"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'windwp/nvim-autopairs'
  use "RRethy/vim-illuminate"
  use "Schemastore/schemastore"

  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

-- Debugging
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

-- Lsp plugins
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  use {
    "ray-x/lsp_signature.nvim",
  }

-- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "David-Kunz/cmp-npm"

-- cmp-tabnine
--[[  use {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = { -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
      }
    end,

    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }]]
-- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }

  use {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_list = {
        {
          path = "~/devenv/codevion.github.io/",
          syntax = "markdown",
          ext = ".md",
        }
      }

      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
      end
    }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    tag = "nightly", -- optional, update every week. (see issue #1193)
  }

end)
