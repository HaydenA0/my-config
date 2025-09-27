vim.o.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto"
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " })
require("config.lazy")
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd("silent! lcd %:p:h")
	end,
})

local function clear_comments()
	local commentstring = vim.bo.commentstring
	if commentstring == "" then
		print("No comment string defined for this filetype")
		return
	end

	local comment_pattern = commentstring:gsub("%%s", ""):gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for i, line in ipairs(lines) do
		lines[i] = line:gsub("%s*" .. comment_pattern .. ".*", "")
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	print("Comments cleared!")
end

vim.api.nvim_create_user_command("ClearComments", clear_comments, {})
vim.keymap.set("i", "<C-p>", '<C-r>"', { noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 250

vim.keymap.set("n", "0", "0", { noremap = true })
vim.keymap.set("n", "00", "$", { noremap = true })

vim.keymap.set({ "v", "o" }, "0", "0", { noremap = true })
vim.keymap.set({ "v", "o" }, "00", "$", { noremap = true })
vim.o.conceallevel = 2
vim.o.concealcursor = "nc"


vim.keymap.set( "n" , "<A-Tab>", "<C-w>w", { noremap = true })
vim.keymap.set( "n" , "<A-j>", "<C-w>j", { noremap = true })
vim.keymap.set( "n" , "<A-k>", "<C-w>k", { noremap = true })
vim.keymap.set( "n" , "<A-l>", "<C-w>l", { noremap = true })
vim.keymap.set( "n" , "<A-h>", "<C-w>h", { noremap = true })

vim.keymap.set("n", "<A-H>", "<C-w>H", { noremap = true, desc = "Move window to far left" })
vim.keymap.set("n", "<A-J>", "<C-w>J", { noremap = true, desc = "Move window to bottom" })
vim.keymap.set("n", "<A-K>", "<C-w>K", { noremap = true, desc = "Move window to top" })
vim.keymap.set("n", "<A-L>", "<C-w>L", { noremap = true, desc = "Move window to far right" })

vim.keymap.set("n", "<A-Up>",    ":resize +2<CR>", { noremap = true, desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>",  ":resize -2<CR>", { noremap = true, desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>",  ":vertical resize -2<CR>", { noremap = true, desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, desc = "Increase window width" })

vim.keymap.set("n", "<A-f>", ":tabnew<CR>:b#<CR>:bwipeout #<CR>", { noremap = true, desc = "Move current buffer to new tab and close old" })

vim.keymap.set("n", "<A-1>", "1gt", { noremap = true })
vim.keymap.set("n", "<A-2>", "2gt", { noremap = true })
vim.keymap.set("n", "<A-3>", "3gt", { noremap = true })
vim.keymap.set("n", "<A-4>", "4gt", { noremap = true })


vim.keymap.set("n", "<leader>r", function()
  require("telescope").extensions.neoclip.default()
end, { desc = "Open Neoclip registers" })

-- Navigate to the next page in the PDF
vim.keymap.set("n", "<leader>jj", "<cmd>:lua require('pdfview.renderer').next_page()<CR>", { desc = "PDFview: Next page" })

-- Navigate to the previous page in the PDF
vim.keymap.set("n", "<leader>kk", "<cmd>:lua require('pdfview.renderer').previous_page()<CR>", { desc = "PDFview: Previous page" })


-- Delete all buffers except the current one
function _G.cleanBuffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf)
      and vim.bo[buf].buflisted
      and buf ~= current
    then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
  print("Cleaned all other buffers.")
end

-- Optional: create a convenient command
vim.api.nvim_create_user_command("CleanBuffers", cleanBuffers, {})

