return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
    },
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim.uv" } },
      },
    },
    config = function()
      -- Configure LSP servers
      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("lua_ls", {})

      -- Enable LSP servers
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
    end,
  },
}

