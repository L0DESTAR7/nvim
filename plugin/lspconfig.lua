--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  enable_format_on_save(client, bufnr)

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server.cmd", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "css", "scss", "less" },
  cmd = { "tailwindcss-language-server.cmd", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  filetypes = { "css", "scss", "less", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "vscode-css-language-server.cmd", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  cmd = { "clangd" },
}

nvim_lsp.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "wxs", "wixproj", "wxl" },
  single_file_support = true,
}

nvim_lsp.ltex.setup {
  on_attach = on_attach,
  cmd = { 'ltex-ls' },
  filetypes = { 'tex', 'bib', 'markdown' },
  capabilities = capabilities,
  settings = {
    ltex = {
      enabled = { 'latex', 'tex', 'bib', 'markdown' },
      checkFrequency = 'edit',
      language = 'en',
      diagnosticSeverity = 'information',
      setenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'en',
      },
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {},
    },
  },
}


nvim_lsp.pylsp.setup {
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = {
          enabled = true,
        }
      }
    }
  }
}


nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'docker-langserver', '--stdio' },
  filetypes = { 'dockerfile' },
  single_file_support = true
}

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'docker-langserver', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose' },
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  },
  single_file_support = true
}


nvim_lsp.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'prisma-language-server', '--stdio' },
  filetypes = { 'prisma' },
  settings = {
    prisma = {
      prismaFmtBinPath = ""
    }
  }
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "\u{ea71}" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
