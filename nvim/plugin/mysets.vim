set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set relativenumber
set number
set cursorline "高亮当前行
set nohlsearch
set incsearch
set smartcase
set ignorecase
set hidden
set visualbell t_vb= 
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set scrolloff=8
set display=lastline
set completeopt+=longest,menuone,noinsert,noselect "插入模式中，只插入匹配的最长公共文本
"set completeopt-=preview " 不显示补全的额外信息
set wildmenu
set nostartofline "使用gg、G、C-D等移动操作符时，光标尽可能保持在同一列上
set signcolumn=yes
set colorcolumn=120
try
  "形成配对的字符，可以使用%命令跳转的
  set matchpairs=(:),{:},[:],《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:”,':',":"
catch /^Vim\%((\a\+)\)\=:E474/
endtry

set updatetime=50
