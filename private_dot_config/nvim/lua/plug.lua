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
  use {
    'L3MON4D3/LuaSnip',                              -- Snippet Engine and Snippet Expansion
    requires = { 'saadparwaiz1/cmp_luasnip' }
  }
  use {
    'hrsh7th/nvim-cmp',                              -- autocompletion framework
    config = function()
      vim.opt.completeopt = 'menu,menuone,noselect'
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
        },
      })
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'                         -- nvim-cmp source for neovim's built-in language server client
  use 'hrsh7th/cmp-nvim-lsp-signature-help'          -- nvim-cmp source for displaying function signatures
  use 'hrsh7th/cmp-buffer'                           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'                             -- nvim-cmp source for filesystem paths
  use 'simrat39/symbols-outline.nvim'                -- A tree like view for symbols, using LSP
  use {                                              -- Parser generator
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'majutsushi/tagbar'                            -- code structure
  use 'Yggdroot/indentLine'                          -- see indentation
  use 'puremourning/vimspector'                      -- debugging tool
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
  use 'OmniSharp/omnisharp-vim'                      -- OmniSharp
  use {                                              -- tabs
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
end)
