local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print("ERROR: Treesitter not installed")
end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'tsx',
    'lua',
    'json',
    'css',
    'dart',
    'java',
    'typescript',
    'javascript',
  },
  autotag = {
    enable = true,
  }
}
