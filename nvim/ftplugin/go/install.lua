local urls = {
  gofumpt = "mvdan.cc/gofumpt@latest",
  goimports_reviser = "github.com/incu6us/goimports-reviser/v3@latest",
  golines = "github.com/segmentio/golines@v0.9.0",
}

local function install(pkg)
  local Job = require "plenary.job"
  local u = require "gopher._utils"

  local url = urls[pkg]

  Job:new({
    command = "go",
    args = { "install", url },
    on_exit = function(_, retval)
      if retval ~= 0 then
        u.notify("command 'go install " .. url .. "' exited with code " .. retval, "error")
        return
      end

      u.notify("install " .. url .. " finished", "info ")
    end,
  }):start()
end

vim.api.nvim_create_user_command("NonelsInstall", "lua installDependecy()", {nargs=0})

function installDependecy()
    for pkg, _ in pairs(urls) do
        install(pkg)
    end
end
