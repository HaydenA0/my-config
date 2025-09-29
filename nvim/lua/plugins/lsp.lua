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

      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("lua_ls", {})


      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")

      vim.keymap.set("n", "<C-s>", vim.diagnostic.open_float, { noremap = true, silent = true })
    end,
  },
}

