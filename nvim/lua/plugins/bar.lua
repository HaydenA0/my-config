return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function getNowPlaying()
			local command = "playerctl -p spotify metadata --format '{{artist}} 󰻂 {{title}} - Vibing'"
			local pipe = io.popen(command)
			if not pipe then
				return ""
			end
			local output = pipe:read("*a")
			pipe:close()
			local clean_output = output:match("^%s*(.-)%s*$")
			if clean_output and clean_output ~= "" then
				return "🎵 " .. clean_output
			else
				return ""
			end
		end

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
				lualine_a = { "branch" },
				lualine_b = { "filename" },
				lualine_c = {
					"mode",
					getNowPlaying,
					"diagnostics",
				},
				lualine_x = {
					function()
						return "神は死んだ"
					end,
					function()
						return "::ARCH-LINUX"
					end,
				},
				lualine_y = {
					function()
						return "::UNIX-07"
					end,
				},
				lualine_z = {
					function()
						return "::HAJORA"
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
