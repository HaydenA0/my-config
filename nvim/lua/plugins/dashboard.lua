return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 1. Your custom ASCII art header
		dashboard.section.header.val = {
			[[⡇⣿⣿⣆⢻⣿⡽⣻⣆⠹⣿⣽⣿⣽⣷⣿⢆⣿⠜⠛⠋⠈⠛⠃⠙⣺⠼⣷⢿]],
			[[⣷⢨⣭⣭⣥⡡⣶⣟⣾⣰⡹⣿⣿⣿⣿⣿⢾⠁⣠⣶⠾⠿⢷⣶⣄⠈⢫/⣿]],
			[[⢿⡆⣿⣿⣿⣷⡝⣿⣿⣧⣗⣿⡿⣟⣿⣾⡇⣸⡟⣡⡐⡲⢦⡌⢻⣷⡀⢸⣿]],
			[[⣿⣿⡜⠘⠛⠛⠛⠋⢽⣷⣿⣯⣿⣿⣿⣿⣷⣿⡇⣿⠷⣻⣦⡭⢂⢿⣇⠈⣿]],
			[[⣿⠊⠀⣠⣤⡶⠶⣤⣤⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⡜⣩⢿⣶⡟⣸⣿⣆⡉]],
			[[⠇⠀⣼⣿⢁⠰⠰⣤⢍⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⠯⢿⠻⢃⣟⢬⣭⣶]],
			[[⠄⢸⣿⡧⣿⣷⢻⣤⡯⢆⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣏⣚⣳⣵]],
			[[⠀⢸⣿⣿⡈⠤⠿⣻⣧⣿⠆⣿⣿⣿⣿⣿⣿⣳⡜⣿⣿⣿⣿⣿//⣿⣿⣿]],
			[[⣦⠠⣻⣿⣷⣌⠹⣯⢿⡟⢣⣿⣿⣿⣿⣿⣿⣿⢛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
			[[⣿/⡙⣿⣿⡿⢷⢶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣯⢸⣳⡜⢿⣿⣿⣿⣿⣿⣿⠇]],
			[[⣿⡛⣿⢦⡹⣓⣯⣭⡝⣿//⣿⣿⣿⣿⣿⣿⡔⢧⣛⣸⣿⣿⣿⣿⡿⠃⣠]],
			[[⣾⡽⡆⢿⠼⡻⠞⣣⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⠿⠋⠀⣈⠁]],
			[[⣿⣽⣷⠀⠓⠷⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⣡⠴⢮⡽⡹⢧]],
		}

		-- 2. Your menu buttons
		dashboard.section.buttons.val = {
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
			dashboard.button("f", "󰈞  Find Files", ":Telescope find_files<CR>"),
			dashboard.button("i", "  New File", ":ene <BAR> startinsert<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.config)
	end,
}
