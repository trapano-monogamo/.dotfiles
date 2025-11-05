local options = {
	compatible = false,
	backup = false,
	swapfile = false,
	clipboard = "unnamedplus",
	completeopt = { "menuone","noselect" },
	cmdheight = 1,
	splitright = true,
	splitbelow = true,
	number = false,
	numberwidth = 2,
	signcolumn = "no",
	smartindent = true,
	shiftwidth = 4,
	tabstop = 4,
	expandtab = false,
	cursorline = false,
	wrap = false,
	wildmenu = true,
	pumheight = 10,
	is = true,
	hls = false,
	ignorecase = true,
	scrolloff = 2,
	sidescrolloff = 2,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end


-- Additional opts

vim.netrw_banner = 0 -- no banner
vim.g.netrw_liststyle = 3 -- tree view
vim.opt.path:append { "**" }

vim.cmd([[

set guicursor=i:block
set guicursor=a:blinkon100

syntax on

]])


-- COLORSCHEME

-- sorbet (dark purple-ish with green), gruber-darker (tsoding), wildcharm (dark black and purple)
local colorscheme = "quiet"
vim.opt.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Could not load colorscheme '" .. colorscheme .. "'")
	return
end
