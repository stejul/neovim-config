local colorscheme = "tokyonight"

if string.match(colorscheme, "tokyonight") then
  vim.g.tokyonight_style = "night"
end
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
