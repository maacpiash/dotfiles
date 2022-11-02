return require('packer').startup(function()
  use 'wbthomason/packer.nvim'                       -- so packer can update itself
  use {                                              -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {                                              -- filesystem navigation
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',              -- filesystem icons
      'MunifTanjim/nui.nvim',
    }
  }

  use 'neovim/nvim-lspconfig'                        -- native LSP support
  use {
    'L3MON4D3/LuaSnip',                              -- Snippet Engine and Snippet Expansion
    requires = { 'saadparwaiz1/cmp_luasnip' }
  }
  use 'hrsh7th/nvim-cmp'                             -- autocompletion framework
  use 'hrsh7th/cmp-nvim-lsp'                         -- nvim-cmp source for neovim's built-in language server client
  use 'hrsh7th/cmp-nvim-lsp-signature-help'          -- nvim-cmp source for displaying function signatures
  use 'hrsh7th/cmp-buffer'                           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'                             -- nvim-cmp source for filesystem paths
  use 'simrat39/symbols-outline.nvim'                -- A tree like view for symbols, using LSP
  use {
    'nvim-treesitter/nvim-treesitter',               -- Parser generator
    run = ':TSUpdate'
  }
  use 'majutsushi/tagbar'                            -- code structure
  use 'Yggdroot/indentLine'                          -- see indentation
  use 'puremourning/vimspector'                      -- debugging tool
  use 'windwp/nvim-autopairs'                        -- auto close brackets, etc.
  use 'editorconfig/editorconfig-vim'                -- editorconfig
  use 'tpope/vim-commentary'                         -- comment/uncomment
  use {
    'nvim-lualine/lualine.nvim',                     -- A fast and configurable Neovim statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'martinsione/darkplus.nvim'                    -- dark VS theme
  use 'folke/tokyonight.nvim'                        -- another dark theme
  use 'whatyouhide/vim-gotham'                       -- Gotham, a very dark theme
  use 'OmniSharp/omnisharp-vim'                      -- OmniSharp
  use {                                              -- tabs
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
end)
