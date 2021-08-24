require("nvim-autopairs").setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  auto_select = false,  -- auto select first item
})
