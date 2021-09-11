return require('packer').startup(function(use)
    -- Packer
	use 'wbthomason/packer.nvim'

	--colorschemes
	use "gruvbox-community/gruvbox"

	--comment
	use "tpope/vim-commentary"

	--fugitive
	use "tpope/vim-fugitive"

	--surround
	use "tpope/vim-surround"

	--lsp
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-compe"

	--telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

	----treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config=require'nvim-treesitter.configs'.setup{highlight={enable=true}}}

	--nvim_tree
	use "kyazdani42/nvim-tree.lua"

	--formatter
	use "mhartington/formatter.nvim"

	--bufferline
	use { 'romgrk/barbar.nvim', requires="kyazdani42/nvim-web-devicons"}

	--auto-pairs
	use{"windwp/nvim-autopairs"}

end)
