return require('packer').startup(function(use)
    -- Packer
	use 'wbthomason/packer.nvim'

	--colorschemes
	use "gruvbox-community/gruvbox"

	--comment
	use "tpope/vim-commentary"

	--lsp
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-compe"

	--statusline
	use{'tjdevries/express_line.nvim'}

	--telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

	----treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config=require'nvim-treesitter.configs'.setup{highlight={enable=true}}}

	--emmet
	use"mattn/emmet-vim"

	--nvim_tree
	use "kyazdani42/nvim-tree.lua"

	--formatter
	use "mhartington/formatter.nvim"

	--fugitive
	use "tpope/vim-fugitive"

	--surround
	use "tpope/vim-surround"

	--bufferline
	use { 'romgrk/barbar.nvim'}
	use{'kyazdani42/nvim-web-devicons'}

	--Toggle-term
	use {"akinsho/nvim-toggleterm.lua"}

	--auto-pairs
	use{"windwp/nvim-autopairs"}
	use{"windwp/nvim-ts-autotag"}

end)
