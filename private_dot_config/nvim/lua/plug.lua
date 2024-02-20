return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                       -- so packer can update itself
  use {                                              -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-tree/nvim-tree.lua',                       -- A file explorer tree for neovim written in lua
    requires = {
      'nvim-tree/nvim-web-devicons',                 -- file icons
    }
  }
  use {
    'williamboman/mason.nvim',                       -- manage external editor tooling such as LSP servers
    'williamboman/mason-lspconfig.nvim',              -- Extension to mason.nvim
    'neovim/nvim-lspconfig',                          -- native LSP support
  }
  use({
    'utilyre/barbecue.nvim',                         --  A VS Code like winbar for Neovim
    tag = '*',
    requires = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    after = 'nvim-web-devicons',
    config = function()
      require('barbecue').setup()
    end,
  })
  use {
    'L3MON4D3/LuaSnip',                              -- Snippet Engine and Snippet Expansion
    requires = { 'saadparwaiz1/cmp_luasnip' }
  }
  use 'hrsh7th/nvim-cmp'                             -- autocompletion framework
  use 'hrsh7th/cmp-nvim-lsp'                         -- nvim-cmp source for neovim's built-in language server client
  use 'hrsh7th/cmp-nvim-lsp-signature-help'          -- nvim-cmp source for displaying function signatures
  use 'hrsh7th/cmp-buffer'                           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'                             -- nvim-cmp source for filesystem paths
  use 'onsails/lspkind.nvim'                         -- vscode-like pictograms for neovim lsp completion items
  use 'simrat39/symbols-outline.nvim'                -- A tree like view for symbols, using LSP
  use {
    'nvim-treesitter/nvim-treesitter',               -- Parser generator
    run = ':TSUpdate'
  }
  use 'majutsushi/tagbar'                            -- code structure
  use 'Yggdroot/indentLine'                          -- see indentation
  use 'puremourning/vimspector'                      -- debugging tool
  use 'windwp/nvim-autopairs'                        -- auto close brackets, etc.
  use 'gpanders/editorconfig.nvim'                   -- EditorConfig plugin for NeoVim written in Fennel
  use 'tpope/vim-commentary'                         -- comment/uncomment
  use {
    'nvim-lualine/lualine.nvim',                     -- A fast and configurable Neovim statusline
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'martinsione/darkplus.nvim'                    -- dark VS theme
  use 'whatyouhide/vim-gotham'                       -- Gotham, a very dark theme
  use { "catppuccin/nvim", as = "catppuccin" }       -- Catpuccin theme
  use 'fedepujol/move.nvim'                          -- move lines and blocks and auto-indent them
  use {                                              -- tabs
    'romgrk/barbar.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use 'jose-elias-alvarez/null-ls.nvim'              -- allow non-LSP sources (e.g. Prettier) to hook into LSP client
  use 'MunifTanjim/prettier.nvim'                    -- Prettier
  use {
    'ellisonleao/glow.nvim',                         -- markdown preview
    config = function()
      require('glow').setup()
    end,
  }
  use {
    'gorbit99/codewindow.nvim',                      -- minimap of code
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',           -- show (blank) indentation of lines
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append 'space:⋅'
      vim.opt.listchars:append 'eol:↴'
      require('indent_blankline').setup {
        show_end_of_line = false,
        space_char_blankline = ' ',
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',                       -- Git integration for buffers 
    config = function ()
      require('gitsigns').setup()
    end
  }
end)
