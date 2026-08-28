local M = {
  "https://github.com/nvim-treesitter/nvim-treesitter",
}

local parsers = { "lua", "markdown", "markdown_inline", "bash", "python" }
local no_indent = { markdown = true, markdown_inline = true }

function M.config()
  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function(ev)
      vim.treesitter.start()
      if not no_indent[ev.match] then
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

return M
