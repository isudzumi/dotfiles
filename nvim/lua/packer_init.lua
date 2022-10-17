require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/playground'}
    use {'nvim-telescope/telescope.nvim',
        event = 'VimEnter *',
        requires = {{'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim'}},
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        n = {
                            ["<esc>"] = require('telescope.actions').close
                        }
                    }
                },
            }

            require('telescope').load_extension 'file_browser'

            vim.api.nvim_set_keymap('n', '<space>;' ,"<cmd>lua require('telescope.builtin').find_files({find_command={'rg', '--files'}})<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '<space>g',"<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '<space>o',"<cmd>lua require('telescope.builtin').oldfiles()<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '*', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '<space>tr', "<cmd>lua require('telescope.builtin').treesitter()<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '<space>d', "<cmd>lua require('telescope').extensions.file_browser.file_browser({ path='%:p:h', cwd_to_path=true })<CR>", { noremap=true, silent=true })
        end
    }
    use {'windwp/nvim-autopairs',
        event = 'VimEnter *',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }
    use {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }
    use {'editorconfig/editorconfig-vim',
        event = 'VimEnter *',
    }
    use {'EdenEast/nightfox.nvim'}
    use {'L3MON4D3/LuaSnip'}
    use {'hrsh7th/cmp-buffer',
      event = 'VimEnter *',
      requires = {
        {'hrsh7th/nvim-cmp'}
      }
    }
    use {'rafamadriz/friendly-snippets'}
    use {'hrsh7th/cmp-path',
      event = 'VimEnter *',
      requires = {
        {'hrsh7th/nvim-cmp'}
      }
    }
    use {'saadparwaiz1/cmp_luasnip',
      event = 'VimEnter *',
      requires = {
        {'hrsh7th/nvim-cmp'}
      },
    }
    use {'hrsh7th/nvim-cmp',
      event = 'VimEnter *',
      after = {
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'saadparwaiz1/cmp_luasnip'}
      },
      config = function()
        require('plugins/nvim-cmp')
      end
    }
    use {'hrsh7th/cmp-nvim-lsp',
      event = 'VimEnter *',
      requires = {
        {'hrsh7th/nvim-cmp'}
      },
    }
    use {'neovim/nvim-lspconfig',
      event = 'VimEnter *',
      after = { 'cmp-nvim-lsp' },
      config = function()
        require('plugins/lsp-config')
      end
    }
    use {'zbirenbaum/copilot.lua',
      event = 'VimEnter *',
      config = function()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    }
    use {'zbirenbaum/copilot-cmp',
      after = { 'copilot.lua', 'nvim-cmp' },
    }
end)

vim.cmd('colorscheme duskfox')

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
	enable = true
    },
    incremental_selection = {
	enable = true,
	keymaps = {
	    init_selection = "gnn",
	    node_incremental = "grn",
	    scope_incremental = "grc",
	    node_decremental = "grm",
	}
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.vcl = {
    install_info = {
        url = "~/repo/github.com/isudzumi/tree-sitter-vcl",
        files = {"src/parser.c"}
    },
    filetype = "vcl"
}

require('lualine').setup {
    options = {
	theme = 'nightfox'
    }
}
