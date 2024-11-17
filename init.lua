require("config.options")
require("config.lazy")

if vim.fn.argc(-1) == 0 then
	vim.api.nvim_create_autocmd("User", {
		group = vim.api.nvim_create_augroup("NeovimPDE", { clear = true }),
		pattern = "VeryLazy",
		callback = function()
			require("config.autocmds")
			require("config.keymaps")
		end,
	})
else
	require("config.autocmds")
	require("config.keymaps")
end

require("lspconfig").tailwindcss.setup({
	cmd = { "tailwindcss-language-server", "--stdio" }, -- Ensure it points to the correct command
	filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" }, -- File types for Tailwind CSS
	root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tsconfig.json", ".git"), -- Detect root based on Tailwind config
})
