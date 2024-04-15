vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.keymap.set("n",";",":",{silent = false, remap=false})
-- vim.keymap.set("x","waq","<cmd>wqa<cr>")
vim.g.mapleader = "\\"
-- vim.g.mapleader = ","
vim.cmd("set clipboard+=unnamedplus")
vim.opt.cursorline = true
vim.cmd([[filetype on]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[set wrap]])
vim.cmd([[set linebreak]])
vim.cmd([[set textwidth=80]])
require("yanderuri.core.lazy")

require("yanderuri.post-lazy.post-lazy")
require("yanderuri.post-lazy.lsp")
