return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,  -- se carga siempre
  config = function()
    require("nvim-web-devicons").setup({})
  end,
}
