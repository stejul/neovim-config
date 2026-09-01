local M = {
  "https://github.com/folke/which-key.nvim",
}

function M.config()
  local which_key = require "which-key"
  which_key.setup {
    defaults = {
      mode = "n",
      prefix = "<leader>",
    },
    spec = {
      { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
      { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
      { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Term" },
      { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
      { "<leader>b", group = "Buffers" },
      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
      { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
      { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>p", group = "Plugins" },
      { "<leader>pu", "<cmd>lua vim.pack.update()<cr>", desc = "Update" },
      { "<leader>ps", "<cmd>lua vim.pack.update(nil, { offline = true })<cr>", desc = "Status" },
      { "<leader>t", group = "Test" },
      { "<leader>a", group = "Tab" },
      { "<leader>T", group = "Treesitter" },
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      padding = { 2, 2, 2, 2 },
      border = "rounded",
    },
    -- ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }
end

return M
