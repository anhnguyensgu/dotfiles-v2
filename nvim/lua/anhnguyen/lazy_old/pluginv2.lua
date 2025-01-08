local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lua.anhnguyen.lazy_init").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim",    cmd = "Neoconf" },
  "folke/neodev.nvim",
  { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        tag = "v0.0.1"
      },                          -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    -- config = function()
    --     vim.cmd('colorscheme rose-pine')
    -- end
  },
  { "windwp/nvim-autopairs",   commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" },
  {
    'nvim-treesitter/nvim-treesitter',
    -- tag = "v0.9.1"
  },
  { 'ziglang/zig.vim' },
  { 'Mofiqul/dracula.nvim' },
  { 'simrat39/rust-tools.nvim' },
  -- { 'fatih/vim-go' }, -
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      vim.keymap.set("n", "<leader>grt", ":GoTestFunc -v -F -n 1<cr>")
    end,
    ft = { "go", 'gomod' },
  },
  { 'ray-x/guihua.lua' },
  { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = "BufReadPre",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        return {
            debug = true,
            sources = {
                formatting.shfmt,
                formatting.prettier,
                formatting.clang_format,
                formatting.taplo,
                formatting.black,
                formatting.fish_indent,
                diagnostics.fish,
                diagnostics.trail_space,
                diagnostics.cspell.with({
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = vim.diagnostic.severity["WARN"]
                    end,
                }),
                diagnostics.editorconfig_checker,
                code_actions.gitsigns,
                code_actions.cspell,
            },
        }
    end,
  },
  -- {
  --   'MunifTanjim/prettier.nvim',
  --   config = function()
  --     local prettier = require("prettier")
  --
  --     prettier.setup({
  --       ["null-ls"] = {
  --         condition = function()
  --           return prettier.config_exists({
  --             -- if `false`, skips checking `package.json` for `"prettier"` key
  --             check_package_json = true,
  --           })
  --         end,
  --         runtime_condition = function(_params)
  --           -- return false to skip running prettier
  --           return true
  --         end,
  --         timeout = 5000,
  --       },
  --       bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  --       filetypes = {
  --         "css",
  --         "graphql",
  --         "html",
  --         "javascript",
  --         "javascriptreact",
  --         "json",
  --         "less",
  --         "markdown",
  --         "scss",
  --         "typescript",
  --         "typescriptreact",
  --         "yaml",
  --       },
  --     })
  --   end
  -- },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    'BlackLight/nvim-http'
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }
})
