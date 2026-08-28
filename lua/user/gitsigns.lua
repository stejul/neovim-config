local M = {
  "https://github.com/lewis6991/gitsigns.nvim",
}

function M.config()
  local gitsigns = require "gitsigns"

  gitsigns.setup {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    current_line_blame = false,
    current_line_blame_opts = {
      delay = 500,
    },
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>gb", gitsigns.toggle_current_line_blame, desc = "Toggle Blame" },
    { "<leader>gj", function() gitsigns.nav_hunk "next" end, desc = "Next Hunk" },
    { "<leader>gk", function() gitsigns.nav_hunk "prev" end, desc = "Prev Hunk" },
    { "<leader>gp", gitsigns.preview_hunk, desc = "Preview Hunk" },
    { "<leader>gr", gitsigns.reset_hunk, desc = "Reset Hunk" },
    { "<leader>gs", gitsigns.stage_hunk, desc = "Stage Hunk" },
    { "<leader>gu", gitsigns.undo_stage_hunk, desc = "Undo Stage Hunk" },
  }
end

return M
