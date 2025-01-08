return {
  "sbdchd/neoformat",
  config = function()
    vim.g.neoformat_try_node_exe = 1
    -- local format_group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
    --
    -- -- Create an autocommand to run Neoformat on the specified file types
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" }, -- File types to watch
      callback = function()
        vim.cmd("Neoformat")
      end,
      group = format_group, -- Assign it to the autocommand group
    })
  end
}
