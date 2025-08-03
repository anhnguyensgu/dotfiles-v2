return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        debounce = 25,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = "<Tab>",
          next = false,
          prev = false,
          dismiss = false,
        },
      },
    })
    -- Disable copilot completely
    vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true })

    -- Enable copilot completely
    vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true })
  end,
}
