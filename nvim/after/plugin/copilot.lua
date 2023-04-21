--vim.g.copilot_filetypes = { xml = false, markdown = false }
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]]
--vim.keymap.set("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", {silent = true})
