--[[ keys.lua ]]
local map =vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap the key used to leave insert mode
map('i', 'jk', '<esc>l', opts)

-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle]], {})

-- Toggle tagbar
map('n', 't', [[:TagbarToggle]], {})

-- Telescope
map('n', 'ff', [[:Telescope find_files]], {})
map('n', 'fg', [[:Telescope live_grep]], {})
map('n', 'fb', [[:Telescope buffers]], {})
map('n', 'fs', [[:Telescope grep_string]], {})
map('n', 'fh', [[:Telescope help_tags]], {})

-- Floaterm
map('n', 'tw', [[:FloatermNew<CR>]], opts)
map('t', 'tw', [[<C-\><C-n>:FloatermNew<CR>]], opts)
map('n', 'tp', [[:FloatermPrev<CR>]], opts)
map('t', 'tp', [[<C-\><C-n>:FloatermPrev<CR>]], opts)
map('n', 'tn', [[:FloatermNext<CR>]], opts)
map('t', 'tn', [[<C-\><C-n>:FloatermNext<CR>]], opts)
map('n', 'tt', [[:FloatermToggle<CR>]], opts)
map('t', 'tt', [[<C-\><C-n>:FloatermToggle<CR>]], opts)
