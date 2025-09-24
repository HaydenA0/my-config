return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- optional but keeps it stable
		build = "make install_jsregexp", -- enables advanced regex features
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node

			-- Simple Python cell snippet
			ls.add_snippets("python", {
				s("cell", {
					t({ "#%%", "#%%" }),
				}),
			})

			-- optional keymaps to expand/jump
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				ls.expand_or_jump()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				ls.jump(-1)
			end, { silent = true })
		end,
	},
}
