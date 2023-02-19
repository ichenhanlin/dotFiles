vim.api.nvim_create_user_command("Sw", "w !sudo tee % > null", {nargs=0})
