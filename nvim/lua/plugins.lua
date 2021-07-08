--local execute = vim.api.nvim_command
--local fn = vim.fn

--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

--if fn.empty(fn.glob(install_path)) > 0 then
  --fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  --execute 'packadd packer.nvim'
--end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' --1


    --Colorschemes
    use "gruvbox-community/gruvbox" --2


    --Comment
    use "tpope/vim-commentary" --3


    --lsp
    use "neovim/nvim-lspconfig" --4
    -- use  "nvim-lua/completion-nvim" --5
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("nvim_compe")
        end
    }

    --nvimtree
    use {
        "kyazdani42/nvim-tree.lua", --6
        config = function()
            require("nvimtree")
        end
    }


    --LuaLine
    use {
        'hoob3rt/lualine.nvim', --7
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lua_line')
        end
    }


    --telescope
    use {
        'nvim-telescope/telescope.nvim', --8
        requires = {{'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}},
        config = require('telescope_config').config()
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --9


    --treesitter
     use {
        'nvim-treesitter/nvim-treesitter', --10
        run = ':TSUpdate',
    }
    use "nvim-treesitter/playground" --11


    --emmet
    use"mattn/emmet-vim" --12


    --bufferline -might_remove_in_future
    use {
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("buffer_line")
        end
    }


end)
