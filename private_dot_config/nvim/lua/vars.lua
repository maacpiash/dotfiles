local g = vim.g
g.t_co = 256
g.background = "dark"
g.mapleader = ","
g.localleader = "\\"
-- g.OmniSharp_server_use_net6 = 1
vim.cmd[[colorscheme darkplus]]

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path  
