return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --Colorschemes
    use "gruvbox-community/gruvbox"

    --Comment
    use "tpope/vim-commentary"

    --lsp
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"

    --LuaLine
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

	--telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use "nvim-treesitter/playground"

	--emmet
	use"mattn/emmet-vim"

	--nvim_tree
	use "kyazdani42/nvim-tree.lua"

	--harpoon
	use "ThePrimeagen/harpoon"

	--formatter
	use "mhartington/formatter.nvim"

	--fugitive
	use "tpope/vim-fugitive"

end)
