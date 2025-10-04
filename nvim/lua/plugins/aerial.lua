-- In your plugins configuration file
return {
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- optional for icons
		},
		config = function()
			require("aerial").setup({
				-- Attach to all buffers by default
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			-- Add a keymap to toggle the aerial view
			vim.keymap.set("n", "<leader>of", "<cmd>AerialToggle<CR>", { desc = "Toggle Outline" })
		end,
	},
}
