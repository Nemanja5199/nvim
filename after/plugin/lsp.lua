-- Setup Mason
require("mason").setup({})
-- Setup mason-lspconfig
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "clangd", "eslint", "vtsls", "html", "cssls", "pyright", "ruff", "rust_analyzer" },
})
vim.opt.updatetime = 300
-- LSP Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- Find references
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- Hover documentation
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- Rename
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- Code actions
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		-- Show error under cursor
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		-- Jump to next/previous error
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, opts)
	end,
})
-- Auto-show diagnostics after leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.diagnostic.show()
	end,
})
-- Auto-show diagnostics when buffer changes
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.diagnostic.show()
	end,
})
-- Show diagnostics inline
vim.diagnostic.config({
	virtual_text = true, -- Shows error text at end of line
	signs = false, -- Shows W, E, etc in gutter
	underline = false, -- Underlines errors
	update_in_insert = false,
})
-- Setup language servers (NEW SYNTAX for Neovim 0.11+)
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- Tells lua_ls that 'vim' is a valid global
			},
			workspace = {
				library = vim.env.VIMRUNTIME, -- Makes it understand Neovim API
				checkThirdParty = false, -- Don't ask about third party libraries
			},
			telemetry = {
				enable = false, -- Don't send telemetry
			},
		},
	},
})
vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			format = {
				semicolons = "insert",
			},
			preferences = {
				importModuleSpecifier = "non-relative",
			},
		},
		javascript = {
			format = {
				semicolons = "insert",
			},
		},
	},
})

vim.lsp.config("vtsls", {
	capabilities = capabilities,
	settings = {
		vtsls = {
			enableMoveToFile = true,
			autoUseWorkspaceTsdk = true,
		},
		typescript = {
			preferences = {
				organizeImportsCollation = "ordinal", -- Add this
				organizeImportsIgnoreCase = true,
				importModuleSpecifier = "non-relative",
				importModuleSpecifierEnding = "minimal",
			},
			suggest = {
				autoImports = true,
				completeFunctionCalls = true, -- Add this
			},
		},
		javascript = {
			preferences = {
				includeCompletionsForImportStatements = true,
				includeCompletionsWithInsertText = true,
			},
			suggest = {
				autoImports = true,
				completeFunctionCalls = true,
			},
		},
	},
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index=false", -- Disable background indexing
		"--clang-tidy=false",
		"--completion-style=bundled",
		"--limit-results=10",
	},
})

vim.lsp.config("eslint", {})

vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- "off", "basic", or "strict"
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			-- Ruff LSP settings
			lineLength = 88,
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				runBuildScripts = true,
			},
			checkOnSave = true,
			check = {
				command = "clippy",
				extraArgs = { "--no-deps" },
			},
			procMacro = {
				enable = true,
			},
			inlayHints = {
				bindingModeHints = { enable = false },
				chainingHints = { enable = true },
				closingBraceHints = { enable = true, minLines = 25 },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
})

-- Enable them
vim.lsp.enable("lua_ls")
--vim.lsp.enable("vtsls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("eslint")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
vim.lsp.enable("rust_analyzer")
