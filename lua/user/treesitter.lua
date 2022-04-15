local configs = require("nvim-treesitter.configs")
local filetypes = {
  'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'smarty'
}

configs.setup {
  rainbow = {
    enable = true,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {enable = true, filetypes = filetypes},
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {""}, -- List of parsers to ignore installing
  autopairs = {enable = true},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {""}, -- list of language that will be disabled
    additional_vim_regex_highlighting = true

  },
  indent = {enable = true, disable = {"yaml"}},
  context_commentstring = {enable = true, enable_autocmd = false}
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {spacing = 2, severity_limit = 'Warning'},
      update_in_insert = true
    })
