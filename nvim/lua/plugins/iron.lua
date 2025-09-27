-- This is a plugin specification for lazy.nvim, see:
-- https://github.com/folke/lazy.nvim#-plugin-spec

return {
	"hkupty/iron.nvim",
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				-- Whether a repl should be discarded or not when closing
				scratch_repl = true,
				-- REPL definitions for different filetypes
				repl_definition = {
					sh = {
						command = { "bash" },
					},
					python = {
						command = { "ipython", "--no-autoindent" },
					},
					        block_dividers = { "#%%", "# %%" },    -- key line
					-- Add any other languages you use here
					-- lua = {
					--   command = { "lua" },
					-- },
				},

				-- How the repl window will be displayed.
				-- We use iron's view module to open it on the right with a width of 80 columns.
				repl_open_cmd = view.split.vertical.botright(80),
			},

			-- Keybindings for iron operations.
			-- We use <leader> as the prefix, which is a common Neovim convention.
			-- By default, <leader> is "\". Many users map it to spacebar:
			--   vim.g.mapleader = " "
			keymaps = {
				-- Opens and closes the REPL window
				toggle_repl = "<leader>rr",

				-- Send the current line to the REPL
				send_line = "<leader>sl",

				-- Send a visual selection (a block of code) to the REPL
				visual_send = "<leader>sc",

				-- Send the entire file to the REPL
				send_file = "<leader>sf",
				-- Send a block 
				  send_code_block          = "<space>sb",

				-- Other useful mappings
				cr = "<leader>s<cr>", -- Send and execute line
				interrupt = "<leader>s<space>", -- Send interrupt signal (Ctrl-C)
				exit = "<leader>rq", -- Exit the REPL process
				clear = "<leader>rc", -- Clear the REPL screen
			},

			-- Highlight the code that was sent to the REPL
			highlight = {
				italic = true,
			},

			-- Ignore blank lines when sending a visual selection
			ignore_blank_lines = true,
		})

		-- Custom keymap to toggle focus between your code buffer and the REPL.
		-- This is mapped here because it uses custom logic not available in iron's keymaps table.
		-- NOTE: <A-Tab> might not work in all terminals. If it doesn't,
		-- you can change it to another mapping like "<leader>rf" (repl-focus).
		vim.keymap.set("n", "<A-Tab>", function()
			local iron_core = require("iron.core")
			local iron_view = require("iron.view")

			-- If no REPL is running, there's nothing to focus
			if vim.tbl_isempty(iron_core.buffers) then
				vim.notify("No active Iron REPL.", vim.log.levels.WARN, { title = "Iron" })
				return
			end

			local repl_win_nr = iron_view.get_current_repl_winnr()

			-- If the REPL window is hidden, :IronFocus will un-hide and focus it
			if not repl_win_nr or not vim.api.nvim_win_is_valid(repl_win_nr) then
				vim.cmd("IronFocus")
				return
			end

			-- If we are already in the REPL window, jump back to the previous window
			if vim.api.nvim_get_current_win() == repl_win_nr then
				vim.cmd("wincmd p")
			-- Otherwise, focus the REPL window
			else
				vim.cmd("IronFocus")
			end
		end, { desc = "Iron: Toggle focus between code and REPL", noremap = true, silent = true })
	end,
}

-- <leader>rr	Open / Close (Toggle) the REPL window
-- <A-Tab>	Switch focus between code and REPL
-- <leader>sl	Send the current Line
-- <leader>sc	Send the visual selection (Code block)
-- <leader>sf	Send the entire File
-- <leader>rq	Quit and exit the REPL process
-- <leader>rc	Clear the REPL screen
-- <leader>sb	Send a block 
