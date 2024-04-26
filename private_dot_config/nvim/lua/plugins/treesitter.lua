return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
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
      end
   }
}
