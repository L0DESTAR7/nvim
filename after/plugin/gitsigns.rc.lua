local status, gitsigns = pcall(require, "gitsigns")

if (not status) then return end

gitsigns.setup({
  signs = {
    delete = { text = '│' },
  },
  numhl =  true,
})

vim.api.nvim_set_hl(0, "GitSignsUntracked", {fg = "#A1CD5E"})
