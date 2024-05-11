local present, formatter = pcall(require, "formatter")

if not present then
    return
end

formatter.setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- go = {
    --   require("formatter.filetypes.go").gofmt,
    --   require("formatter.filetypes.go").goimports,
    -- },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--     group = vim.api.nvim_create_augroup("FormatAutogroup", {clear=true}),
--     desc = "format after save",
--     callback=function ()
--         vim.cmd("FormatWrite")
--     end,
-- })
