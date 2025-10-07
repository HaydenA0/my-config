-- return {
--
-- 	{
-- 		"rebelot/kanagawa.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("kanagawa").setup({
-- 				transparent = true,
-- 				keywordStyle = { bold = true },
-- 				statementStyle = { bold = true },
-- 				theme = "wave",
-- 			})
-- 			vim.cmd("colorscheme kanagawa-wave")
-- 		end,
-- 	},
--
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 		event = { "BufReadPost", "BufNewFile" },
-- 		config = function()
-- 			require("nvim-treesitter.configs").setup({
-- 				highlight = {
-- 					enable = true,
-- 					additional_vim_regex_highlighting = false,
-- 				},
-- 				indent = { enable = true },
-- 				ensure_installed = {
-- 					"lua",
-- 					"vim",
-- 					"vimdoc",
-- 					"bash",
-- 					"javascript",
-- 					"typescript",
-- 					"html",
-- 					"css",
-- 					"python",
-- 					"json",
-- 					"markdown",
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       -- Default options
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "", -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = false,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
-- Using Lazy

return {
	{
		"vague2k/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				transparent = true,

				-- optional configuration here
			})
			vim.cmd("colorscheme vague")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
}
