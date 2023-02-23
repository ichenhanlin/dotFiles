local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require 'nvim-treesitter.install'.compilers = { "clang" }
treesitter.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"vim", "go", "lua", "bash", "java", "gomod", "gowork", "json", "python", "yaml", "proto"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true
  },
}
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
