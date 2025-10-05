-- General editor options
vim.o.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"
vim.opt.fillchars:append({ eob = " " })
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 250
vim.o.conceallevel = 2
vim.o.concealcursor = "nc"
vim.opt.cmdheight = 0 -- Hide command line unless in use

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		severity_min = vim.diagnostic.severity.WARN,
	},
	severity_sort = true,
})
