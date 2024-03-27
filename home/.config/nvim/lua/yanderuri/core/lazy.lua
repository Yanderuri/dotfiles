local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

opts = {
	defaults = {
	    lazy = false, -- should plugins be lazy-loaded?
	    version = "*",
	    -- default `cond` you can use to globally disable a lot of plugins
	    -- when running inside vscode for example
	    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
	    -- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	throttle = 30,
}

require("lazy").setup("yanderuri.config", opts)
