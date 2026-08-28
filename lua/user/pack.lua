local modules = {
  "user.colorscheme",
  "user.devicons",
  "user.treesitter",
  "user.mason",
  "user.schemastore",
  "user.lspconfig",
  "user.cmp",
  "user.telescope",
  "user.none-ls",
  "user.illuminate",
  "user.gitsigns",
  "user.whichkey",
  "user.nvimtree",
  "user.comment",
  "user.lualine",
  "user.navic",
  "user.breadcrumbs",
  "user.harpoon",
  "user.neotest",
  "user.autopairs",
  "user.neogit",
  "user.alpha",
  "user.project",
  "user.indentline",
  "user.toggleterm",
  "user.extras.gitlinker",
  "user.extras.bqf",
  "user.extras.ufo",
  "user.extras.oil",
  "user.extras.dressing",
  "user.extras.eyeliner",
  "user.extras.fidget",
}

-- Shell commands to run on install/update, keyed by plugin name
-- (see `:help vim.pack-events`). Must be registered before the first
-- `vim.pack.add()` call.
local build_hooks = {
  ["telescope-fzf-native.nvim"] = { "make" },
}

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local cmd = build_hooks[ev.data.spec.name]
    if cmd and (ev.data.kind == "install" or ev.data.kind == "update") then
      vim.system(cmd, { cwd = ev.data.path })
    end
  end,
})

local function plugin_name(spec)
  if type(spec) == "table" then
    return spec.name or spec.src:match "([^/]+)$"
  end
  return spec:match "([^/]+)$"
end

local loaded, specs, seen = {}, {}, {}

local function add_spec(spec)
  local name = plugin_name(spec)
  if not seen[name] then
    seen[name] = true
    specs[#specs + 1] = spec
  end
end

for _, name in ipairs(modules) do
  local mod = require(name)
  loaded[#loaded + 1] = mod
  add_spec { src = mod[1], name = mod.name, version = mod.version }
  for _, dep in ipairs(mod.deps or {}) do
    add_spec(dep)
  end
end

vim.pack.add(specs, { confirm = false })

for _, mod in ipairs(loaded) do
  if mod.config then
    mod.config()
  end
end
