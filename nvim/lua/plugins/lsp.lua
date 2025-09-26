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
      vim.lsp.config("dockerls", {
        cmd = require'lspcontainers'.command('dockerls'),
        root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
      })

      -- Enable LSP servers
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("dockerls")
    end,
  },
}

