nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap <leader>ev <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap <leader>ev <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap <leader>ec <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap <leader>ec <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap <leader>em <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
