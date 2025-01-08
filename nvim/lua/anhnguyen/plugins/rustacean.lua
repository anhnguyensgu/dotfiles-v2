return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function()
          vim.lsp.inlay_hint.enable(false)
          vim.keymap.set("n", "rr", function()
            vim.cmd.RustLsp('runnables')
          end)
        end,
      },
    }
  end
}
