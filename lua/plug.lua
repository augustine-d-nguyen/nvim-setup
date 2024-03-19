-- [[ plug.lua ]]

local manager = require('pckr')
local pack_root = vim.fn.stdpath('config') .. '/plug'

manager.setup{
    package_root      = pack_root,
    max_jobs          = nil,
    autoremove        = false,
    autoinstall       = true,
    git               = {
        cmd                 = 'git',
        depth               = 1,
        clone_timeout       = 60,
        default_url_format  = 'https://github.com/%s'
    },
    log               = { level = 'warn' },
    opt_dir = pack_root .. '/opt',
    start_dir = pack_root .. '/start',
    lockfile          = {
        path                = pack_root .. '/lockfile.lua'
    }
}

local keys = require('pckr.loader.keys')
return manager.add{
    -- [[ Plugins Go Here ]]
    
    -- [[ Decoration ]]
    -- Starting screen
    'mhinz/vim-startify';

    -- File explorer
    {'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    };

    -- Theme
    'Mofiqul/dracula.nvim';
    'danilamihailov/beacon.nvim';
    {'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    };

    -- Find files
    {'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    };

    -- View structure of classes or functions
    'preservim/tagbar';

    -- Indent lines
    'lukas-reineke/indent-blankline.nvim';

    -- Git support
    'tpope/vim-fugitive';
    'junegunn/gv.vim';

    -- Auto close brackets
    {'windwp/nvim-autopairs',
        event = 'InsertEnter'
    };

    -- Terminal
    'voldikss/vim-floaterm';
    
    -- Highlight
    {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    };

    -- LSP
    'neovim/nvim-lspconfig';
    -- Copilot lua
    {'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
    };

    -- Snipets
    'rafamadriz/friendly-snippets';
    {'L3MON4D3/LuaSnip',
        tag = "v2.*",
        run = "make install_jsregexp"
    };

    -- Cmp
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'saadparwaiz1/cmp_luasnip';
	'hrsh7th/cmp-nvim-lua';
	'zbirenbaum/copilot-cmp';
}
