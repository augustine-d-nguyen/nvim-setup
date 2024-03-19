require('telescope').setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
        -- other layout configuration here
        },
        -- other defaults configuration here
    },
    pickers = {
        find_files = {
            theme = 'dropdown',
        }
    }
})