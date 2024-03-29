vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n",";",":",{silent = false, remap=false})
vim.g.mapleader = ","


require("yanderuri.core.lazy")
require("yanderuri.extras.post-lazy")
