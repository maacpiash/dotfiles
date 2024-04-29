local ensure_installed = {
   omnisharp = {},
   tsserver = {},
   pyright = {},
   gopls = {},
   gleam = {},
   html = {},
   astro = {},
   emmet_ls = {},
   cssls = {},
   eslint = {},
   clangd = {},
   lua_ls = {},
   rust_analyzer = {},
   svelte = {},
   -- linters and formatters
   black = {},
   eslint_d = {},
   prettierd = {},
   stylua = {},
}

return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         for server, config in pairs(ensure_installed) do
            lspconfig[server].setup(config)
         end
         vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
         vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
      end
   }
}
