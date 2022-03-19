local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
--
-- null_ls.setup({
-- 	debug = true,
-- 	sources = {
--     formatting.prettier.with({ extra_args = { "--no-semi" } }),
-- 		formatting.black.with({ extra_args = { "--fast" } }),
--     formatting.gofmt,
--     on_attach = function(client)
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
--   end
-- }
-- })
--

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier, formatting.black, formatting.gofmt, formatting.shfmt,
    formatting.clang_format, formatting.cmake_format, formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
    vim.cmd [[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
})
