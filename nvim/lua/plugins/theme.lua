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
--

return {
  "vague2k/vague.nvim",
  lazy = false,       
  priority = 1000,   
  config = function()
    require("vague").setup({
      transparent = true,
      bold = true,
      italic = true,

      style = {
        boolean      = "bold",
        number       = "none",
        float        = "none",
        error        = "bold",
        comments     = "italic",
        conditionals = "none",
        functions    = "none",
        headings     = "bold",
        operators    = "none",
        strings      = "italic",
        variables    = "none",
        keywords         = "none",
        keyword_return   = "italic",
        keywords_loop    = "none",
        keywords_label   = "none",
        keywords_exception = "none",
        builtin_constants = "bold",
        builtin_functions = "none",
        builtin_types     = "bold",
        builtin_variables = "none",
      },

      plugins = {
        cmp = { match = "bold", match_fuzzy = "bold" },
        dashboard = { footer = "italic" },
        lsp = {
          diagnostic_error = "bold",
          diagnostic_hint  = "none",
          diagnostic_info  = "italic",
          diagnostic_ok    = "none",
          diagnostic_warn  = "bold",
        },
        neotest   = { focused = "bold", adapter_name = "bold" },
        telescope = { match = "bold" },
      },

      -- Override or add highlight groups if you like
      on_highlights = function(highlights, colors)
        -- example: change Normal text foreground
        -- highlights.Normal.fg = "#d0d0d0"
      end,

    })

    -- Activate the colorscheme
    vim.cmd.colorscheme("vague")
  end,
}

