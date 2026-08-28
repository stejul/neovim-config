local M = {
  "https://github.com/linrongbin16/gitlinker.nvim",
  deps = {
    "https://github.com/nvim-lua/plenary.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>gy", "<cmd>GitLink!<cr>", desc = "Git link" },
    { "<leader>gY", "<cmd>GitLink blam<cr>", desc = "Git link blame" },
  }

  require("gitlinker").setup {
    message = false,
    console_log = false,
  }
end

return M
