local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
  [[    __               __                 __]],
  [[   / /   ____   ____/ /  ___    _____  / /_  ____ _   _____]],
  [[  / /   / __ \ / __  /  / _ \  / ___/ / __/ / __ `/  / ___/]],
  [[ / /___/ /_/ // /_/ /  /  __/ (__  ) / /_  / /_/ /  / /]],
  [[/_____/\____/ \__,_/   \___/ /____/  \__/  \__,_/  /_/]],
  [[ ]],
  [[ ]]
}
dashboard.section.buttons.val = {
  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button("ff", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("fg", "󰺯  Find string", ":Telescope live_grep<CR>"),
  dashboard.button("fc", "󰺯  View Git commits", ":Telescope git_commits<CR>"),
  dashboard.button("ft", "󰭎  Open telescope", ":Telescope<CR>"),
  dashboard.button("GC", "  Configuration", ":cd $LOCALAPPDATA/nvim<CR>:NvimTreeOpen<CR>"),
  dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
}
dashboard.section.footer.val = {
}

dashboard.config.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady echo ' Ready']]

alpha.setup(dashboard.config)
vim.b.miniindentscope_disable = true
