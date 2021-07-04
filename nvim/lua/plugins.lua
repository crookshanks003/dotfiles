--local execute = vim.api.nvim_command
--local fn = vim.fn

--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

--if fn.empty(fn.glob(install_path)) > 0 then
  --fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  --execute 'packadd packer.nvim'
--end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    --Colorschemes
    use "gruvbox-community/gruvbox"


    --lsp
    use "neovim/nvim-lspconfig"
    use  "nvim-lua/completion-nvim"
    use {
        "kabouzeid/nvim-lspinstall",
        config = function()
            require"lspinstall".setup()
        end
    }


    --nvimtree
    use 'kyazdani42/nvim-web-devicons'
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvimtree")
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
        {'nvim-lua/plenary.nvim'}
    }}


    --treesitter
     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use "nvim-treesitter/playground"

  end)
