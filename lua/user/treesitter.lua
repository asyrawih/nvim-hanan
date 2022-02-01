local configs = require("nvim-treesitter.configs")
local filetypes = {'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'}

configs.setup {
  autotag= {
    enable = true ,  
    filetypes = filetypes
  },
  ensure_installed = "maintained",
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
