-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- if fn.empty(fn.glob(install_path)) > 0 then
--   fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--   execute 'packadd packer.nvim'
-- end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    --Colorschemes
    use "gruvbox-community/gruvbox"


    --Comment
    use "tpope/vim-commentary"


    --lsp
    use "neovim/nvim-lspconfig"
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("nvim_compe")
        end
    }


    --LuaLine
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lua_line')
        end
    }


    --telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}},
        config = require('telescope_config').config()
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    --treesitter
     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use "nvim-treesitter/playground"


    --emmet
    use"mattn/emmet-vim"


    --nvim_tree
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim_tree")
        end
    }


    --harpoon
    use {
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup()
        end
    }


    --formatter
    use {
        "mhartington/formatter.nvim",
        config = function()
            require("formatter_nvim")
        end
    }

end)
