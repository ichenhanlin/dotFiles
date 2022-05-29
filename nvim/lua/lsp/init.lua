-- This should be loaded first
require("lsp.lsp-installer")
require("lsp.completion")
require("lsp.go-lsp")
require("lsp.python-lsp")
require("lsp.java-lsp")

vim.diagnostic.config(
    {
        underline = {
            severity = vim.diagnostic.severity.ERROR
        },
        -- 诊断的虚拟文本
        virtual_text = {
            -- 显示的前缀，可选项：'●', '▎', 'x'
            -- 默认是一个小方块，不是很好看，所以这里改了
            prefix = "●",
            -- 是否总是显示前缀？是的
            source = "always",
            severity = vim.diagnostic.severity.ERROR
        },
        float = {
            -- 是否显示诊断来源？是的
            source = "always"
        },
    }
)
