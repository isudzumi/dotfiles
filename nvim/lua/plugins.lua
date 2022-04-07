require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'neovim/nvim-lspconfig'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/playground'}
    use {'nvim-lua/completion-nvim', event = 'VimEnter' }
    use {'nvim-telescope/telescope-file-browser.nvim',
        event = 'VimEnter',
    }
    use {'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        requires = {{'nvim-lua/plenary.nvim'}},
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
        event = 'VimEnter',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }
    use {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }
    use {'editorconfig/editorconfig-vim',
        event = 'VimEnter',
    }
    use {'EdenEast/nightfox.nvim'}
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

local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('completion').on_attach(client)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'clangd', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('lualine').setup {
    options = {
	theme = 'nightfox'
    }
}

