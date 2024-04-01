-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local ok, _ = pcall(vim.cmd, "colorscheme nightfly")
if not ok then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

-- Set Background to be Transparent
vim.g.nightflyTransparent = true
