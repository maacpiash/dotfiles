vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--    vim.fn.system({
--       "git",
--       "clone",
--       "--filter=blob:none",
--       "https://github.com/folke/lazy.nvim.git",
--       "--branch=stable", -- latest stable release
--       lazypath,
--    })
-- end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   {
      "martinsione/darkplus.nvim",
      priority = 1000,
   },
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
   },
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.6",
      dependencies = { "nvim-lua/plenary.nvim" },
   },
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      }
   },
}
local options = {}

require("lazy").setup(plugins, options)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })

vim.cmd([[colorscheme tokyonight-night]])

local ts_config = require("nvim-treesitter.configs")
ts_config.setup({
   ensure_installed = {
      "c_sharp",
      "comment",
      "dockerfile",
      "gleam",
      "go",
      "json",
      "lua",
      "markdown",
      "python",
      "r",
      "regex",
      "rust",
      "todotxt",
      "typescript",
      "yaml",
   },
   highlight = { enabled = true },
   indent = { enabled = true },
})

vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", {})
