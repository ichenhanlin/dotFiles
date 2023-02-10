scriptencoding utf-8

lua require("plugins")
lua require("lsp")
lua require("statusline")
lua require("treesitter")
lua require("mytelescope")
lua require("symbol-outline")
lua require("myExplore")

let mapleader=" "
" ctrl-s 保存文件
"nnoremap <silent> <C-s> :update<CR>
"inoremap <silent> <C-s> <ESC>:update<CR>
"vnoremap <silent> <C-S> <ESC>:update<CR>
" ctrl-d 关闭窗口
" nmap <C-D> <C-W>q
" 强制保存只读文件
command! -nargs=0 Sw w !sudo tee % > null
" 终端模式下<ESC>退出插入模式
tnoremap <ESC> <C-\><C-n>
" To use ALT+{h, j, k, l} to navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nmap <leader>o <Plug>OSCYank
vnoremap <leader>o :OSCYank<CR>


nnoremap <leader>tf :ToggleTerm direction=float<CR>
nnoremap <leader>th :ToggleTerm direction=horizontal<CR>

nnoremap <F4> :NvimTreeFindFileToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :SymbolsOutline<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

let g:oscyank_term = 'default'
