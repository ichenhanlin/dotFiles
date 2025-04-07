local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

-- vim.diagnostic.config(
--     {
--         -- underline = {
--         --     severity = vim.diagnostic.severity.ERROR
--         -- },
--         -- 诊断的虚拟文本
--         virtual_text = {
--             -- 显示的前缀，可选项：'●', '▎', 'x'
--             -- 默认是一个小方块，不是很好看，所以这里改了
--             prefix = "●",
--             -- 是否总是显示前缀？是的
--             source = "always",
--             -- severity = vim.diagnostic.severity.ERROR
--         },
--         float = {
--             -- 是否显示诊断来源？是的
--             source = "always"
--         },
--     }
-- )

local capabilities = vim.lsp.protocol.make_client_capabilities()

local present, cmp = pcall(require, 'cmp_nvim_lsp')
if present then
    capabilities = cmp.default_capabilities()
end

-- Golang
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            gofumpt = true,
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            codelenses = {
                generate = true, -- show the `go generate` lens.
                gc_details = true, -- Show a code lens toggling the display of gc's choices.
                test = true,
                tidy = true,
                vendor = true,
                regenerate_cgo = true,
                upgrade_dependency = true,
            },
        },
    },
    init_options = {
        usePlaceholders = true,
    },
    capabilities = capabilities,
}

-- codelens
function check_capabilities(feature, bufnr)
  local clients = vim.lsp.get_active_clients({ buffer = bufnr or vim.api.nvim_get_current_buf() })

  local supported_client = false
  for _, client in pairs(clients) do
    -- supported_client = client.resolved_capabilities[feature]
    supported_client = client.server_capabilities[feature]
    if supported_client then
      return client
    end
  end

  return false
end

function refresh_codelens()
    local bufnr = vim.api.nvim_get_current_buf()
    if not check_capabilities("codeLensProvider", bufnr) then
        return
    end
    vim.lsp.codelens.refresh()
end

-- local codelens_group = vim.api.nvim_create_augroup("display_codelens", {clear = true})
-- vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "InsertLeave"}, {
--     group = codelens_group,
--     desc = "display codelens for current buffer",
--     callback=function ()
--         refresh_codelens()
--     end,
-- })
--

-- Python
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 120
        }
      }
    }
  }
}

