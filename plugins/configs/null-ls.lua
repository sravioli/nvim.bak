local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local sources = {
  -- DIAGNOSTICS
  -- null_ls.builtins.diagnostics.cspell,
  -- null_ls.builtins.code_actions.cspell.with {
  --   config = {
  --     on_success = function(cspell_config_file, params)
  --       -- format the cspell config file
  --       os.execute(
  --         string.format("cat %s | jq -S '.words |= sort' | tee %s > /dev/null", cspell_config_file, cspell_config_file)
  --       )
  --     end,
  --   },
  -- },

  null_ls.builtins.diagnostics.codespell,

  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.formatting.cbfmt,
  null_ls.builtins.diagnostics.vale,

  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.taplo,

  null_ls.builtins.diagnostics.yamllint,
  null_ls.builtins.formatting.yamlfix,
  null_ls.builtins.diagnostics.actionlint,

  null_ls.builtins.formatting.fixjson,

  null_ls.builtins.diagnostics.cpplint,
  null_ls.builtins.formatting.clang_format.with {
    extra_args = {
      "--style",
      "{SpacesBeforeTrailingComments: 2, AlignTrailingComments: {Kind: Always, OverEmptyLines: 2}}",
    },
  },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,

  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
