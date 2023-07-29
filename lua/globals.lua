autocmd = vim.api.nvim_create_autocmd
usercmd = vim.api.nvim_create_user_command
augroup = vim.api.nvim_create_augroup

custom_debug = true
tlc_toggle = false

cmd_main_win = ":keepjumps lua require\"utils\".go_to_main_window()<CR>"
