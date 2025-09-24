return{
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end
}

-- yssb wraps the whole line
-- cs"b changes "__" to (__)
