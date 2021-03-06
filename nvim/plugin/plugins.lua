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

	--compe
	-- use "hrsh7th/nvim-compe"

	--emmet
	use "mattn/emmet-vim"

	--cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	--telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim', module="plenary"}}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

	----treesitter
	use 'nvim-treesitter/nvim-treesitter'

	--nvim_tree
	use "kyazdani42/nvim-tree.lua"

	--formatter
	use "mhartington/formatter.nvim"

	--bufferline
	use { 'romgrk/barbar.nvim', requires={"kyazdani42/nvim-web-devicons", module="nvim-web-devicons"}}

	--auto-pairs
	use{"windwp/nvim-autopairs"}

end)
