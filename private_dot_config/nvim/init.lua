-- IMPORTS
require('plug')      -- Plugins
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('barb')      -- Barbar
require('neot')      -- NeoTree

require('nvim-autopairs').setup{}

local cmp = require('cmp')
cmp.setup {
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
  },
  enabled = function()
    if vim.bo.buftype == 'csharp' then
      return false
    end
    return true
  end,
}

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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local pid = vim.fn.getpid()
local omnisharpPath = '/home/ahad/Development/Tools/omnisharp-roslyn-v1.39.1/OmniSharp.dll'

require('lspconfig').omnisharp.setup {
  cmd = {
    'dotnet', omnisharpPath, '--languageserver' , '--hostPID', tostring(pid)
  },
  capabilities = capabilities,
}

require('lsp_signature').setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
})
-- For JS/TS/JSX/TSX, JSON, Python, and R, I am using CoC.nvim.
