return require('packer').startup(function(use)
    -- Packer
	use 'wbthomason/packer.nvim'

	--colorschemes
	use "ellisonleao/gruvbox.nvim"

	--comment
	use "tpope/vim-commentary"

	--fugitive
	use "tpope/vim-fugitive"

	--surround
	use "tpope/vim-surround"

	--lsp
	use "neovim/nvim-lspconfig"

	--cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'

	--snippet
	use'L3MON4D3/LuaSnip'
	use'saadparwaiz1/cmp_luasnip'

	--telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim', module="plenary"}}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

	----treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-context'

	--nvim_tree
	use "kyazdani42/nvim-tree.lua"

	--formatter
	use "mhartington/formatter.nvim"

	--bufferline
	use 'romgrk/barbar.nvim'
	--icons
	use "kyazdani42/nvim-web-devicons"

	--auto-pairs
	use{"windwp/nvim-autopairs"}

	--gitsigns
	use{"lewis6991/gitsigns.nvim"}

	--golang
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua'

end)
