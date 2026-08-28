local M = {
  "https://github.com/NeogitOrg/neogit",
  deps = {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/sindrets/diffview.nvim",
  },
}

function M.config()
  local neogit = require "neogit"

  neogit.setup {
    integrations = {
      telescope = true,
      diffview = true,
    },
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>gg", function() neogit.open() end, desc = "Neogit" },
  }
end

return M
