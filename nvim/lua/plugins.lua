require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'neovim/nvim-lspconfig'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-lua/completion-nvim'}
end)

require'nvim-treesitter.configs'.setup {
  hightlight = {
    enable = true
  }

  indent = {
    enable = true
  }
}
