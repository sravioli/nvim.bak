local function shell()
  if package.config:sub(1, 1) == "/" then
    return "bash"
  else
    return "pwsh"
  end
end

return {
  terminals = {
    shell = shell(),
    type_opts = {
      float = {
        relative = "editor",
        row = 0.15,
        col = 0.10,
        width = 0.80,
        height = 0.60,
        border = require "custom.assets.border",
      },
    },
  },
}
