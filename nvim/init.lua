
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true})

vim.keymap.set('n', '<leader>nf', vim.cmd.NvimTreeFocus, { noremap = true })
vim.keymap.set('n', '<leader>nc', vim.cmd.NvimTreeCollapse, { noremap = true })
vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle, { noremap = true })
vim.keymap.set('n', '<leader>ns', vim.cmd.NvimTreeFindFile, { noremap = true })
--vim.keymap.set("n", "<Leader>a", vim.cmd.copilot#Accept, {silent = true})

vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode)

vim.keymap.set("n", "<leader>qa", vim.cmd.wqall)

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

-- Netrw
vim.cmd("let g:netrw_banner = 0")

function Colors(color)
    -- current colors are "gruvbox" or "rose-pine"
    color = color or "rose-pine"
    require('lualine').setup {
        options = {theme = 'rose-pine'}
    }

    require('rose-pine').setup({
        variant = 'main',
        dark_variant = 'moon',
        disable_background = true,
        bold_vert_split = true,
        disable_float_background = true,
        disable_italics = true,

        groups = {
          punctuation = 'text';
        };

        highlight_groups = {
            TelescopeBorder = { fg = "highlight_high", bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopePromptNormal = { bg = "none" },
            TelescopeResultsNormal = { fg = "subtle", bg = "none" },
            TelescopeSelection = { fg = "text", bg = "none" },
            TelescopeSelectionCaret = { fg = "rose", bg = "none" },
            --CursorLine = { bg = 'foam', blend = 10 },
            StatusLine = { fg = 'none', bg = 'pine', blend = 0 },

        }
	})

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

end

Colors()

