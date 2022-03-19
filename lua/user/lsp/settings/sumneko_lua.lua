return {
  Lua = {
    diagnostics = {
      globals = {"vim"},
      disable={"undefined-global"}
    },
    workspaces = {
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      }
    }
  }
}
