local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

local formatting = null_ls.builtins.formatting
local sources = {
  formatting.gofmt, formatting.lua_format.with({
    extra_args = {
      '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
      '--break-after-table-lb', '--indent-width=2'
    }
  }), formatting.prettier.with({
    filetypes = {"css", "vue", "typescriptreact", "typescript", "javascript", "javascriptreact"}
  })
}
null_ls.setup({sources = sources})
