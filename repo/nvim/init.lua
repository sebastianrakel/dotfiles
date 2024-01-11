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

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.wo.wrap = false
vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.title = true
vim.opt.titlestring = "nvim - %{fnamemodify(getcwd(), ':t')}"
vim.opt.clipboard = "unnamedplus"

require("lazy").setup({
	{
		"RRethy/nvim-base16",
		config = function()
			vim.cmd('colorscheme base16-dracula')
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			vim.keymap.set('n', '[Telescope]', '<Nop>')
			vim.keymap.set('n', '<leader>f', '[Telescope]', {remap = true})

			vim.keymap.set('n', '[Telescope]f', '<cmd>Telescope find_files<cr>')
			vim.keymap.set('n', '[Telescope]b', '<cmd>Telescope buffers<cr>')
		end
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
		},
		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			cmp.setup({
				completion = { completeopt = 'menu,menueone,noinsert' },
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					['<Up>'] = cmp.mapping.select_prev_item(),
					['<Down>'] = cmp.mapping.select_next_item(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { 'i', 's' })
				},
				snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'luasnip' },
				})
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "lua", "vim", "go", "typescript", "vue" },
				auto_install = true,
				highlight = {
					enable = true,
				},
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			local lspconfig_util = require('lspconfig.util')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = '*.go',
				command = 'lua vim.lsp.buf.format()',
			})

			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				local opts = { buffer = bufnr }

				vim.keymap.set('n', '[Lsp]', '[Nop]', opts)
				vim.keymap.set('n', '<leader>l', '[Lsp]', { remap = true, unpack(opts) })
				vim.keymap.set('n', '[Lsp]d', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', '[Lsp]a', vim.lsp.buf.code_action, opts)

				vim.keymap.set('n', '[Lsp]f', function() vim.lsp.buf.format({async = false}) end, opts)
				vim.keymap.set('n', '<leader>b', '<C-o>', opts)
			end

			local function get_typescript_server_path()
				local modules_path = vim.fn.system("npm list --global --parseable typescript | head -n1 | tr -d '\n'", true)
				return lspconfig_util.path.join(modules_path, 'lib')
			end


			lspconfig.lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
							path = vim.split(package.path, ';')
						},
						diagnostics = { globals = { 'vim' } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false }
					}
				}
			}

			lspconfig.gopls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
	      			gopls = {
				        experimentalPostfixCompletions = true,
				        analyses = {
		        		    unusedparams = true,
				            shadow = true,
				        },
			    	    staticcheck = true,
						gofumpt = true,
					},
		        },
			}

			lspconfig.volar.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					typescript = {
						tsdk = get_typescript_server_path()
					},
				},
			})

			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"RRethy/nvim-base16",
		},
		config = function ()
			local lualine = require('lualine')
			lualine.setup({
				options = {
					theme = 'base16'
				}
			})
		end
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require('mini.surround').setup()
			require('mini.align').setup()
			require('mini.indentscope').setup({
				draw = { animation = require('mini.indentscope').gen_animation.none() },
			})
			require('mini.comment').setup()
		end
	},
	{
		"NeogitOrg/neogit",
  		dependencies = {
    		"nvim-lua/plenary.nvim",         -- required
    		"sindrets/diffview.nvim",        -- optional - Diff integration
  		},
  		config = function()
			local neogit = require('neogit')
			neogit.setup {}
			vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>', { remap = true})
		end
	}
})

