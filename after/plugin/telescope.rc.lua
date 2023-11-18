local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files,{})
vim.keymap.set('n', 'fg', builtin.live_grep,{})
vim.keymap.set('n', 'fs', builtin.grep_string,{})
vim.keymap.set('n', 'fb', builtin.buffers,{})
vim.keymap.set('n', 'fc', builtin.git_commits,{})

