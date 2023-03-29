require('base')
require('highlights')
require('maps')
require('plugins')


local has = function(x)
  return vim.fn.has(x) == 1
end


local is_win = has "win32"


if is_win then
  require('windows')
end

-- Nvim Tree section ---------------------------------------------------------------------

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termGUIcolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

------------------------------------------------------------------------------------------

-- Mason section ------------------------------------------------------------------------
require('mason').setup()
require('mason-lspconfig').setup()
