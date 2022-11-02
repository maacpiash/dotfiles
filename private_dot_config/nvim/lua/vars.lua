local g = vim.g
g.t_co = 256
g.background = 'dark'
g.mapleader = ','
g.localleader = '\\'
g.OmniSharp_server_use_net6 = 1
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.python3_host_prog = vim.fn.system('which python3'):gsub('\n+', '')
vim.cmd[[colorscheme darkplus]]

g.EditorConfig_exec_path = '/home/ahad/.dotnet/tools/editorconfig'
g.EditorConfig_core_mode = 'external_command'

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

vim.opt.completeopt = 'menu,menuone,noselect'
