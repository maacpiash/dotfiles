return require('packer').startup(function()
  use 'wbthomason/packer.nvim'                       -- so packer can update itself
  use {                                              -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {                                              -- filesystem navigation
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",              -- filesystem icons
        "MunifTanjim/nui.nvim",
      }
    }

  use 'neovim/nvim-lspconfig'                        -- native LSP support
  use 'hrsh7th/nvim-cmp'                             -- autocompletion framework
  use 'hrsh7th/cmp-nvim-lsp'                         -- LSP autocompletion provider
  use 'majutsushi/tagbar'                            -- code structure
  use 'Yggdroot/indentLine'                          -- see indentation
  use 'puremourning/vimspector'                      -- debugging tool
  use 'tpope/vim-fugitive'                           -- git integration
  use 'junegunn/gv.vim'                              -- commit history
  use 'windwp/nvim-autopairs'                        -- auto close brackets, etc.
  use 'editorconfig/editorconfig-vim'                -- editorconfig
  use 'tpope/vim-commentary'                         -- comment/uncomment
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'martinsione/darkplus.nvim'                    -- dark VS theme
  use 'folke/tokyonight.nvim'                        -- another dark theme
  use 'whatyouhide/vim-gotham'                       -- Gotham, a very dark theme
  use { 'neoclide/coc.nvim', branch = 'release' }    -- Concquer of Completion
  use 'dense-analysis/ale'                           -- Asynchronous Lint Engine
  use 'OmniSharp/omnisharp-vim'                      -- OmniSharp
  use 'nickspoons/vim-sharpenup'                     -- helper for OmniSharp
  use {                                              -- tabs
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
end)
