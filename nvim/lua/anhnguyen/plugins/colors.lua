-- return {
--     'rose-pine/neovim',
--     as = 'rose-pine',
--     config = function()
--         vim.cmd('colorscheme rose-pine-moon')
--     end
-- }

local spec = {
  { "Mofiqul/vscode.nvim",   lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "catppuccin/nvim",       lazy = false },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- }
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd('colorscheme tokyonight-moon')
      -- require("tokyonight").setup {
      --   transparent = true,
      --   styles = {
      --     sidebars = "transparent",
      --     floats = "transparent",
      --   }
      -- }
    end
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    -- config = function()
    --   vim.cmd('colorscheme rose-pine-moon')
    -- end
  }

}
-- vim.cmd('colorscheme rose-pine-moon')

-- vim.keymap.set("n", "<leader>uu", function() --> Show all custom colors in telescope...
--   for _, color in ipairs(spec) do            --> Load all colors in spec....
--     vim.cmd("Lazy load " .. color.name)      --> vim colorschemes cannot be required...
--   end
--
--   vim.schedule(function() --> Needs to be scheduled:
--     -- stylua: ignore
--     local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
--       "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
--       "desert", "delek", "default", "darkblue", "blue" }
--
--     local completion = vim.fn.getcompletion
--     ---@diagnostic disable-next-line: duplicate-set-field
--     vim.fn.getcompletion = function()                --> override
--       return vim.tbl_filter(function(color)
--         return not vim.tbl_contains(builtins, color) --
--       end, completion("", "color"))
--     end
--
--     vim.cmd("Telescope colorscheme enable_preview=true")
--     vim.fn.getcompletion = completion --> restore
--   end)
-- end, { desc = "Telescope custom colors", silent = true })

return spec
