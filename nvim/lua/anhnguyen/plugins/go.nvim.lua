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
    vim.keymap.set("n", "rr", ":GoTestFunc -v -F -n 1<cr>")
  end,
  ft = { "go", 'gomod' },
}
