-- Set mapleader before anything else
vim.g.mapleader = " "

-- Load core configuration modules
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.commands")

-- Load the plugin manager (Lazy.nvim)
require("config.lazy")
