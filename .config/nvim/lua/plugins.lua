-- Install Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Plugins
return require 'packer'.startup(
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}
    -- Colors
    use {'Mofiqul/dracula.nvim'}
    -- General
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      }
    }
    use {'folke/trouble.nvim'}
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'}
      }
    }
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-sleuth'}
    -- Git/GitHub
    use {'tpope/vim-fugitive'}
    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function ()
        require"octo".setup()
      end
    }
    -- Terminal
    use {'akinsho/toggleterm.nvim'}
    -- LSP
    use {
      'neoclide/coc.nvim',
       branch = 'release'
    }
    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    -- JS/TS
    use {'MaxMEllon/vim-jsx-pretty'}
    -- HTML
    use {'othree/html5.vim'}
    -- CSS
    use {'hail2u/vim-css3-syntax'}
    use {'norcalli/nvim-colorizer.lua'}
    -- GraphQL
    use {'jparise/vim-graphql'}
    -- Lua
    use {'tbastos/vim-lua'}
  end
)
