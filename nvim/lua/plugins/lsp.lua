return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
		},
		config = function()
			require('lspconfig').pyright.setup {}
			require('lspconfig').clangd.setup {}
			require("lspconfig").lua_ls.setup{}
		end

	},
	vim.api.nvim_set_keymap(
  'n',
  '<C-s>',
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

}
