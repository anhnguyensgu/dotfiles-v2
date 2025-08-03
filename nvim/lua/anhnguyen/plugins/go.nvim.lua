return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      tag_options = '',
    })
    -- local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "tr", ":GoTestFunc -v -F -n 1<CR>")
    vim.keymap.set("n", "tf", ":GoTestFile -v -F -n 1<CR>")
    vim.keymap.set("n", "tg", ":GoTestPkg<CR>")
    vim.keymap.set("n", "ta", ":GoTest<CR>")
  end,
  ft = { "go", 'gomod' },
}
