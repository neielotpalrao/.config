-- bufferline.lua
return {
  "akinsho/bufferline.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons", version = "*"},
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({})
  end,
}

