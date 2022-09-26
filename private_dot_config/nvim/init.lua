-- IMPORTS
require('plug')      -- Plugins
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('barb')      -- Barbar
require('neot')      -- NeoTree
require('lsp')       -- LSP

require('nvim-autopairs').setup({})

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' },
    { name = 'path' },
  },
  enabled = true,
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "c_sharp",
    "comment",
    "dockerfile",
    "json5",
    "lua",
    "markdown",
    "python",
    "r",
    "regex",
    "todotxt",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
})
