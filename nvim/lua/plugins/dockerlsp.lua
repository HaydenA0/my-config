return {
  "lspcontainers/lspcontainers.nvim",
  ft = { "lua" },
  dependencies = { "neovim/nvim-lspconfig" },
  opts = function()
    local lspconfig = require("lspconfig")
    local lspcontainers = require("lspcontainers")

    lspconfig.lua_ls.setup({
      cmd = lspcontainers.command("lua_ls"),
      on_attach = function(client, bufnr)
        -- Custom on_attach logic here
      end,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })
  end,
}

