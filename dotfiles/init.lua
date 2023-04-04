vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

----[ Package Manager ]----
---[ Plugin Installation ]---
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "ErichDonGubler/lsp_lines.nvim" -- Error/message 
  use 'simrat39/rust-tools.nvim' -- Rust LSP configuration 

  -- Visual tools
  use 'unblevable/quick-scope' -- Plugin to hilight fastest jumps to words
  use 'brenoprata10/nvim-highlight-colors' -- Inline hex colour codes preview plugin
  use 'nvim-tree/nvim-tree.lua' -- File explorer plugin
  use 'nvim-tree/nvim-web-devicons' -- File explorer plugin
  use 'lewis6991/gitsigns.nvim'
  use {
      'nvim-lualine/lualine.nvim', -- Statusline plugin
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
      'nvim-treesitter/nvim-treesitter', -- Code highlighting
      run = ':TSUpdate'
  }
  use 'petertriho/nvim-scrollbar'

  -- Themes
  use "rebelot/kanagawa.nvim"
end)

---[ Plugin requires ]---
require("nvim-tree").setup()
require("scrollbar").setup()
require("gitsigns").setup()
require("nvim-highlight-colors").setup()

--[ Language Servers ]--
-- Only load Powershell if on a Windows device
if package.config:sub(1,1) == "\\" then
    require("lspconfig").powershell_es.setup {
	bundle_path = 'C:\\Users\\Dale\\Documents\\Programming\\LSP Files\\PowerShellEditorServices',
    }
end

require("lsp_lines").setup()
require("rust-tools").setup()
require("lualine").setup()



---- [ Custom Configurations ]----
-- Turn on syntax highlighting
vim.opt.syntax = "on"

-- Turn on relative line numbers
vim.opt.relativenumber = true

-- Configure the colorscheme
vim.cmd[[colorscheme kanagawa]]
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
vim.keymap.set ("n", "<Leader>s", ":split<CR>")
vim.keymap.set ("n", "<Leader>v", ":vsplit<CR>")
