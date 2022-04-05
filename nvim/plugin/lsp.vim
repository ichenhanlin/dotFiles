" nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>grs :lua vim.lsp.buf.references()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ge :lua vim.diagnostic.open_float()<CR>

" Using telescope instead of native
nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <leader>gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap <leader>grs <cmd>lua require('telescope.builtin').lsp_references()<CR>

nnoremap <leader>co :lua vim.diagnostic.setqflist()<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>lo :lua vim.diagnostic.setloclist()<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprev<cr>
" nnoremap <leader>ln :lua vim.diagnostic.goto_next()<cr>
" nnoremap <leader>lp :lua vim.diagnostic.goto_prev()<cr>

command! Rename lua vim.lsp.buf.rename()

function! SetDiagnositList()
    " lua vim.diagnostic.setloclist({open=false})
    " execute "ll"
    " lua vim.diagnostic.setqflist({open=false})
    " lua vim.diagnostic.setloclist()
    " execute "lw"
endfunction

augroup LSP_Diagnositc
    autocmd!
    "autocmd! BufWrite,BufEnter,InsertLeave * :call SetDiagnositList()
    autocmd! BufWrite * :call SetDiagnositList()
augroup END

