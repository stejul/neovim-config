local M = {
  "https://github.com/jinh0/eyeliner.nvim",
}

function M.config()
  require("eyeliner").setup {
    highlight_on_key = true,
  }
end

return M
