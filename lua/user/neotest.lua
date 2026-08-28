local M = {
  "https://github.com/nvim-neotest/neotest",
  deps = {
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/vim-test/vim-test",
    "https://github.com/nvim-neotest/neotest-vim-test",
    "https://github.com/marilari88/neotest-vitest",
    "https://github.com/nvim-neotest/neotest-python",
    "https://github.com/nvim-neotest/neotest-plenary",
    "https://github.com/rouge8/neotest-rust",
    "https://github.com/lawrence-laz/neotest-zig",
    "https://github.com/rcasia/neotest-bash",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>tt", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Test Nearest" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Test" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Test Stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach Test" },
  }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M
