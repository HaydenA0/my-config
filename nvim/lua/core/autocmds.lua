local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create a group to organize autocommands
local MyAutoCmds = augroup("MyAutoCmds", { clear = true })

-- Change CWD to the current file's directory
autocmd("BufEnter", {
	group = MyAutoCmds,
	callback = function()
		vim.cmd("silent! lcd %:p:h")
	end,
})
