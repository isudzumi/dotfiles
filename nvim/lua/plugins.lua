require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'neovim/nvim-lspconfig'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-lua/completion-nvim', event = 'VimEnter' }
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
                }
            }
            vim.api.nvim_set_keymap('n', '<space>;',"<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap=true, silent=true })
            vim.api.nvim_set_keymap('n', '<space>g',"<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap=true, silent=true })
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

require'nvim-treesitter.configs'.setup {
    hightlight = {
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
    }
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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('completion').on_attach(client)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'clangd' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('nightfox').load('duskfox')

require('lualine').setup {
    options = {
	theme = 'nightfox'
    }
}

