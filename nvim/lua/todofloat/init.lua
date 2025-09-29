local M = {} -- todo module

local function center(outer, inner)
	return (outer - inner) / 2
end
local function window_configuarion()
	local width = math.min(math.floor(vim.o.columns * 0.6), 64)
	local height = math.floor(vim.o.lines * 0.6)
	return {
		relative = "editor",
		width = width,
		height = height,
		col = center(vim.o.columns, width),
		row = center(vim.o.lines, height),
		border = "single",
	}
end
local function open_floating(target_file)
	local buffer = vim.fn.bufnr(target_file, true)
	local win = vim.api.nvim_open_win(buffer, true, window_configuarion())
end

local function setup_user_command()
	local target_file = "/home/anasr/notes/todo.md"
	vim.api.nvim_create_user_command("OpenFloatingTodo", function()
		open_floating(target_file)
	end, {})
end
M.setup = function(opts)
	setup_user_command(opts)
end
return M
