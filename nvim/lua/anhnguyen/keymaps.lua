vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<S-h>", vim.cmd.bprev)
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>c", vim.cmd.bw)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "y", [["+y]]) -- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "p", [["+p]]) -- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "x", [["+d]]) -- Cut to system clipboard
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv")
vim.keymap.set("v", "<leader>r", "\"zy:%s/<C-r>z//g<Left><Left>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>lh", ":Telescope diagnostics<CR>", { desc = "Show Diagnostics" })
-- vim.keymap.set("n", "<leader>lh", function()
--   vim.diagnostic.open_float()
-- end)
vim.keymap.set("i", "jk", "<Esc>")
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Suggestions" })
vim.keymap.set('n', '<leader>dc', function()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = cursor_line })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg('+', message)
    print("Copied diagnostic: " .. message)
  else
    print("No diagnostics on the current line")
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics<CR>", { desc = "List Diagnostics" })

