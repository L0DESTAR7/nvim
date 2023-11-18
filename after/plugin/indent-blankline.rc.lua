local status, ibl = pcall(require, "ibl")

if (not status) then return end

local highlight = {
  "SuttleSwamp",
}


local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "SuttleSwamp", {fg = "#00141A"})
end)


ibl.setup {indent = {highlight = highlight}, scope = {enabled = false}}
