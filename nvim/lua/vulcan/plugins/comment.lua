return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- Import comment plugin safely
    local comment = require("Comment")

    -- Assuming Comment.ft is part of the same plugin or available separately
    local ft = require('Comment.ft')

    -- 1. Using set function
    -- Set only line comment for yaml files
    ft.set('yaml', '#%s')
    -- Set both line and block commentstring for rust files
    ft.set('rust', {'//%s', '/*%s*/'})

    -- Enable comment
    comment.setup({})

    -- Optionally, if you want to use metatable magic as shown in point 2,
    -- you would place that logic here as well. However, based on your initial request,
    -- it seems like you're focusing on the first approach.
  end,
}
