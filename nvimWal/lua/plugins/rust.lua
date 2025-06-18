return {
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				completion = {
					crates = {
						enabled = true,
					},
				},
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
		ft = { "rust" },
		config = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = function(_, bufnr)
						vim.keymap.set("n", "<leader>cR", function()
							vim.cmd.RustLsp("codeAction")
						end, { desc = "Code Action", buffer = bufnr })

						vim.keymap.set("n", "<leader>dr", function()
							vim.cmd.RustLsp("debuggables")
						end, { desc = "Rust Debuggables", buffer = bufnr })
					end,
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								buildScripts = {
									enable = true,
								},
							},
							checkOnSave = true,
							diagnostics = {
								enable = true,
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
							files = {
								excludeDirs = {
									".direnv",
									".git",
									".github",
									".gitlab",
									"bin",
									"node_modules",
									"target",
									"venv",
									".venv",
								},
							},
						},
					},
				},
			}

			-- DAP configuration for codelldb
			local codelldb_path = vim.fn.exepath("codelldb")
			if codelldb_path and codelldb_path ~= "" then
				local liblldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
				if vim.fn.has("mac") == 1 then
					liblldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib"
				end
				require("rustaceanvim.config").setup_dap({
					adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
				})
			else
				vim.notify(
					"**codelldb** not found in PATH. Please install it using :MasonInstall codelldb.",
					vim.log.levels.ERROR,
					{ title = "rustaceanvim" }
				)
			end

			if vim.fn.executable("rust-analyzer") == 0 then
				vim.notify(
					"**rust-analyzer** not found in PATH. Please install it.\nhttps://rust-analyzer.github.io/",
					vim.log.levels.ERROR,
					{ title = "rustaceanvim" }
				)
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.rust_analyzer.setup({})

			-- Diagnostic config
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Floating diagnostic on hover
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
				end,
			})

			vim.o.updatetime = 500

			-- Define signs with Nerd Font icons
			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"mrcjkb/rustaceanvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
				},
			})
		end,
	},
}
