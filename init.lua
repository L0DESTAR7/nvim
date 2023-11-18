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


-- Nightfly Theme section ----------------------------------------------------------------
--
-- Set colorscheme background color to transparent
vim.g.nightflyTransparent = true
-- Customize nightfly String color
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
    vim.api.nvim_set_hl(0, "String", { fg = "#00FFA3", bold = true })
  end,
  group = custom_highlight,
})
-- Set colorscheme
vim.cmd [[colorscheme nightfly]]

------------------------------------------------------------------------------------------

-- Mason section -------------------------------------------------------------------------
require('mason').setup()
require('mason-lspconfig').setup()

-- TODO Comments -------------------------------------------------------------------------
require('todo-comments').setup()


require('telescope').setup()
