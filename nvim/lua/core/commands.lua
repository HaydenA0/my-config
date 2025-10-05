--[[
  Clears all comments from the current buffer.
]]
local function clear_comments()
	local commentstring = vim.bo.commentstring
	if not commentstring or commentstring == "" then
		print("No comment string defined for this filetype")
		return
	end

	-- Escape special characters for Lua patterns
	local comment_pattern = commentstring:gsub("%%s", ""):gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for i, line in ipairs(lines) do
		-- Replace comment and any trailing whitespace with nothing
		lines[i] = line:gsub("%s*" .. comment_pattern .. ".*", "")
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	print("Comments cleared!")
end

vim.api.nvim_create_user_command("ClearComments", clear_comments, {
	desc = "Remove all comments from the current buffer",
})

--[[
  Deletes all listed buffers except for the current one.
]]
local function clean_buffers()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted and buf ~= current then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
	print("Cleaned all other buffers.")
end

-- Assigning to _G makes it globally accessible if needed, but defining it locally is fine too.
_G.cleanBuffers = clean_buffers
vim.api.nvim_create_user_command("CleanBuffers", clean_buffers, {
	desc = "Close all buffers except the current one",
})

--[[
  Custom command to run a project-specific script.
]]
vim.api.nvim_create_user_command("RunCCode4Me", function()
	vim.cmd("!./run.sh")
end, {
	nargs = 0,
	desc = "Execute the project-specific ./run.sh script",
})
