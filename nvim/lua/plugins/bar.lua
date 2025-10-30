return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,

				refresh = {
					statusline = 1000,
				},
			},
			sections = {
				lualine_b = { "filename" },
				lualine_a = { "branch", "mode" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					function()
						return "::UNIX-07"
					end,
				},
				lualine_z = {
					function()
						return "::MY WORLD"
					end,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
