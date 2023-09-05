vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

----[ Package Manager ]----
-- Define the location of lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Install if not found
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

-- Plugin installation specification
require("lazy").setup({
    'tpope/vim-sensible',

    -- LSP config
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    'ErichDonGubler/lsp_lines.nvim', -- Errors/Messages
    'simrat39/rust-tools.nvim', -- Rust LSP configuration
    'neomake/neomake', -- Linting

    -- Visual tools
    'unblevable/quick-scope', -- Plugin to highlight fastest jumps to words
    'brenoprata10/nvim-highlight-colors', -- Inline hex colour codes previw
    'nvim-tree/nvim-tree.lua', -- File explorer plugin
    'nvim-tree/nvim-web-devicons', -- Text icons
    'lewis6991/gitsigns.nvim', -- Git-related text icons
    'nvim-lualine/lualine.nvim', -- Bottom-of-screen status bar
    {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"}, -- Code highlighting
    'petertriho/nvim-scrollbar', -- Right-side scrollbar for filesize context


    -- Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'rebelot/kanagawa.nvim', lazy=true},
})

---[ Plugin requires ]---
require("nvim-tree").setup()
require("scrollbar").setup()
require("gitsigns").setup()
require("nvim-highlight-colors").setup()
require("lualine").setup({
    options = {
	theme = "catppuccin"
    }
})

require("lsp_lines").setup()
require("rust-tools").setup()
--require("lspconfig").rust_analyzer.setup({})
require("lualine").setup()
require("catppuccin").setup({
    integrations = {
	gitsigns = true,
	nvimtree = true,
	treesitter = true,
    }
})



---- [ Custom Configurations ]----
-- Turn on syntax highlighting
vim.opt.syntax = "on"

-- Turn on relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Configure the colorscheme
--vim.cmd[[colorscheme kanagawa]]
vim.cmd[[colorscheme catppuccin-mocha]]
vim.cmd [[set background=dark]]

-- Configure tab settings
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Configure search settings
vim.cmd [[set ignorecase]]
vim.cmd [[set smartcase]]
vim.cmd [[set incsearch]]
vim.cmd [[set hlsearch]]
vim.cmd [[highlight Search    ctermfg=White  ctermbg=Black  cterm=bold]]
vim.cmd [[highlight IncSearch    ctermfg=White  ctermbg=Red    cterm=bold]]

-- Enable filetype detection, plugins, and auto-indent
vim.cmd [[filetype plugin indent on]]
vim.cmd [[set wildmode=longest,list,full]]
vim.cmd [[set mouse=a]]
-- Set the window title to be the file name, if applicable
vim.cmd [[set title]]

-- Configure split settings
vim.cmd [[set fillchars+=vert:\│]]
vim.cmd [[set splitbelow splitright]]

-- Mute the annoying bell sound
vim.cmd [[set vb t_vb=d()]]

-- Turn off inline error/help messages; Covered by lsp_lines
vim.diagnostic.config({virtual_text = false})

-- Configure folding
vim.opt.foldcolumn = '3'
vim.opt.foldmethod = "indent"

----[ Neomake Configuration ]----
-- When writing a buffer (no delay), and on normal mode changes (after 750ms).
vim.cmd [[call neomake#configure#automake('nrwi', 500)]]

----[ Keybinding Configuration ]----
-- Set Leader key
vim.g.mapleader = '\\'
-- Toggle NerdTree
vim.keymap.set ("n", "<Leader>t", ":NvimTreeToggle<CR>")
-- Clear search highlighting
vim.cmd [[nnoremap <nowait><silent> <F1> :noh<CR>]]

-- Toggle pastetoggle
vim.cmd [[set pastetoggle=<F2>]]

-- Move lines up and down in Visual mode
vim.cmd [[vnoremap <silent> <s-J> :m '>+1<CR>gv]]
vim.cmd [[vnoremap <silent> <s-K> :m '<-2<CR>gv]]

-- Indent selected lines in Visual Mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

---[ Split Keybindings ]---
-- Sane split navigation
vim.keymap.set ("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set ("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set ("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set ("n", "<C-H>", "<C-W><C-H>")

-- Pane resizing
vim.keymap.set ("n", "<Leader>h", ":vertical resize -2<CR>")
vim.keymap.set ("n", "<Leader>l", ":vertical resize +2<CR>")
vim.keymap.set ("n", "<Leader>j", ":horizontal resize -2<CR>")
vim.keymap.set ("n", "<Leader>k", ":horizontal resize +2<CR>")

-- Split creation
vim.keymap.set ("n", "<Leader>h", ":split<CR>")
vim.keymap.set ("n", "<Leader>v", ":vsplit<CR>")
