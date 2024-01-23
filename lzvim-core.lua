--    _   ____________ _    ________  ___
--   / | / / ____/ __ \ |  / /  _/  |/  /
--  /  |/ / __/ / / / / | / // // /|_/ /
-- / /|  / /___/ /_/ /| |/ // // /  / /
--/_/ |_/_____/\____/ |___/___/_/  /_/

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.colorcolumn = "80"
return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				-- sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
