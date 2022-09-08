-- OmniSharp --

local omnisharp_config = {}

local pid = vim.fn.getpid()
local omnisharp_path = '/home/ahad/Development/Tools/omnisharp-roslyn-v1.39.1/OmniSharp.dll'

omnisharp_config.cmd = { 'dotnet', omnisharp_path, '--languageserver', '--hostPID', tostring(pid) }

omnisharp_config.handlers = {
   ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
   ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Python --

local python_config = {}

python_config.cmd = { 'pyright-langserver', '--stdio' } -- default

-- TypeScript --

local typescript_config = {}

typescript_config.handlers = {
   ['textDocument/hover'] = vim.lsp.with( vim.lsp.handlers.hover, { border = 'rounded' }),
   ['textDocument/signatureHelp'] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

typescript_config.cmd = { 'typescript-language-server', '--stdio' } -- default

typescript_config.filetypes = {
   'javascript',
   'javascriptreact',
   'javascript.jsx',
   'typescript',
   'typescriptreact',
   'typescript.tsx'
}
typescript_config.init_options = { hostInfo = 'neovim' }
typescript_config.root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')

-- Final --

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
   local buf_set_keymap = vim.keymap.set

   local opts = { noremap=true, silent=true, buffer=bufnr }

   if client.name == 'omnisharp' then
      buf_set_keymap('n', 'gd', '<Cmd>OmniSharpGotoDefinition<CR>', opts)
   else
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
   end
   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
   buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lang_servers = {
   omnisharp = omnisharp_config,
   tsserver = typescript_config,
   -- jedi_language_server = python_config,
}

for name, config in pairs(lang_servers) do
   local capabilities = vim.lsp.protocol.make_client_capabilities()
   config.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

   config.on_attach = on_attach
   lspconfig[name].setup(config)
end
