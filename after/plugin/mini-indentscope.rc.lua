local status, miniscope = pcall(require, "mini.indentscope")

if(not status) then return end

miniscope.setup({
  symbol = "▎"
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {fg= "#00FFA3"})

