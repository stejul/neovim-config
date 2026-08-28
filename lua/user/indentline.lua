local M = {
  "https://github.com/lukas-reineke/indent-blankline.nvim",
}

function M.config()
  local icons = require "user.icons"

  require("ibl").setup {
    indent = { char = icons.ui.IndentDot },
    scope = { enabled = true, char = icons.ui.LineMiddle },
    exclude = {
      buftypes = { "terminal", "nofile" },
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
        "markdown",
        "markdown_inline",
      },
    },
  }
end

return M
