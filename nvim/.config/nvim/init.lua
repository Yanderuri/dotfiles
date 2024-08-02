vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
