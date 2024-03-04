local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Kanagawa theme
  -- use('rebelot/kanagawa.nvim')
  -- vim.cmd('colorscheme kanagawa')
  -- One dark theme
  -- use('olimorris/onedarkpro.nvim')
  -- vim.cmd('colorscheme onedark')
  -- Tokyo night theme
  use('folke/tokyonight.nvim')
  vim.cmd('colorscheme tokyonight')

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use 'nvim-treesitter/nvim-treesitter-context'
  use('nvim-treesitter/playground')
  -- This plugin works with treesitter to change commentstrings
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('mbbill/undotree')
  -- Git integration
  use({
    'tpope/vim-fugitive',
    requires = {'tpope/vim-rhubarb'}
  })
  -- Comment and uncomment lines using gcc
  use('tpope/vim-commentary')
  -- Indent autodection with editorconfig support
  use('tpope/vim-sleuth')
  use('github/copilot.vim')
  -- Smooth scrolling
  use('karb94/neoscroll.nvim')

  -- nvim tree
  -- use('kyazdani42/nvim-tree.lua')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}

  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end
  }

  -- testing suite for neovim
  use('vim-test/vim-test')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile>
  augroup end
]])
