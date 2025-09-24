return {
	{
		"xiyaowong/transparent.nvim",
		lazy = false, -- load on startup (or set an event if you prefer)
		config = function()
			-- Optional: customize settings here
			require("transparent").setup({
				-- add any configuration options you need
				extra_groups = { -- example groups to clear
					"NormalFloat",
					"NvimTreeNormal",
				},
				exclude = {}, -- groups you want to keep opaque
			})
		end,
	},
}
