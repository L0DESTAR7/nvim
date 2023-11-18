local status, ibl = pcall(require, "ibl")

if (not status) then return end

local highlight = {
  "Teal200",
  "Teal300",
  "Teal400",
  "Teal500",
  "Teal600",
}


local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "Teal200", {fg = "#AEFFE2"})
  vim.api.nvim_set_hl(0, "Teal300", {fg = "#70FFCD"})
  vim.api.nvim_set_hl(0, "Teal400", {fg = "#2BFDB1"})
  vim.api.nvim_set_hl(0, "Teal500", {fg = "#00FFA3"})
  vim.api.nvim_set_hl(0, "Teal600", {fg = "#00C076"})
end)


ibl.setup {indent = {highlight = highlight}}
