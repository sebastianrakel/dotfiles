local packer_present, packer = pcall(require, 'packer')
if not packer_present then
	local installpath = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', installpath})

	packer_present, packer = pcall(require, 'packer')
	if not packer_present then
		error("Couldn't clone packer !\nPacker path: " .. installpath .. "\n" .. packer)
	end
end

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'Mofiqul/dracula.nvim',
		config = function()
			vim.o.background = 'dark'
			vim.o.t_Co = 256
			vim.cmd [[colorscheme dracula]]
		end
	}
	use { 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {
					'bash',
					'c',
					'cpp',
					'lua',
					'rust',
					'go',
				},
				auto_install = true,
				highlight = { enable = true }
			}
		end
	}

  	use { 'neovim/nvim-lspconfig',
  		config = function()
			local lspc = require 'lspconfig'

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			if packer_plugins['cmp-nvim-lsp'] then
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			end

			local servers = {
				'ccls',
				'rust_analyzer',
				'gopls',
			}

			for _, server in ipairs(servers) do
				lspc[server].setup { capabilites = capabilities }
			end

			lspc.sumneko_lua.setup {
			 	capabilities = capabilities,
			 	settings = {
			 		Lua = {
			 			runtime = {
			 				version = 'LuaJIT',
			 				path = vim.split(package.path, ';')
			 			},
						diagnostics = { globals = { 'vim' } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false }
					}
			 	}
			}

			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
		end
	}

	use { 'hrsh7th/cmp-nvim-lsp',
		requires = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'hrsh7th/nvim-cmp'},
		},
		config = function()
			local cmp = require'cmp'

			cmp.setup({
				completion = { completeopt = 'menu,menueone,noinsert' },
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
				},
				formatting = { format = format },
				mapping = cmp.mapping.preset.insert({
				      	['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<TAB>'] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end
	}

	use { 'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		},
		module = 'telescope',
		cmd = 'Telescope',
		setup = function()
			vim.keymap.set('n', '[Telescope]', '<Nop>')
			vim.keymap.set('n', '<leader>f', '[Telescope]', {remap = true})
	                vim.keymap.set('n', '[Telescope]f', '<cmd>Telescope find_files<cr>')
			vim.keymap.set('n', '[Telescope]b', '<cmd>Telescope buffers<cr>')
			vim.keymap.set('n', '[Telescope]gg', '<cmd>Telescope live_grep<cr>')
			vim.keymap.set('n', '[Telescope]gs', '<cmd>Telescope grep_string<cr>')
		end
	}
end)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.colorcolumn = '120'

vim.opt.autochdir = true
