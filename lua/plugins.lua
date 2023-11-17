local status, packer = pcall(require, 'packer')
if (not status) then
  print("ERROR: Packer not installed!")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  -- use {
  --  'svrana/neosolarized.nvim', -- Neosolarized color theme
  --  requires = { 'tjdevries/colorbuddy.nvim' }
  --}
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use {
    'hoob3rt/lualine.nvim' -- Statusline
  }
  use {
    'L3MON4D3/LuaSnip', -- Snippet engine
    tag = "v<CurrentMajor>.*"
  }
  use {
    'nvimdev/lspsaga.nvim' -- LSP UI
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'windwp/nvim-autopairs' -- Autopair { [ ( ... with Fly mode !
  }
  use {
    'windwp/nvim-ts-autotag'
  }
  use {
    "williamboman/mason.nvim", -- Mason: Install and manage lsp
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- LSP Config for neovim
  }
  use {
    'lervag/vimtex'
  }
  use {
    'mfussenegger/nvim-jdtls', -- JDTLS support for Nvim
  }
  use {
    'onsails/lspkind-nvim', -- VScode-like pictograms for auto completion
  }
  use {
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
  }
  use {
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
  }
  use {
    'hrsh7th/cmp-path' -- cmp autocompletion for paths
  }
  use {
    'saadparwaiz1/cmp_luasnip' -- cmp's luasnip support
  }
  use {
    'hrsh7th/nvim-cmp', -- Completion
  }
  use {
    'MunifTanjim/prettier.nvim' -- Prettier for code formatting with nvim LSP
  }
  use {
    'nvim-tree/nvim-tree.lua', -- File explorer written in Lua
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
