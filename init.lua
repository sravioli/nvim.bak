-- mimic vimscript syntax
local let = vim.g
-- local set = vim.opt

-- load the desired providers
local providers = {
  { prov = "node", path = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host" },
  { prov = "ruby", path = "/home/linuxbrew/.linuxbrew/bin/ruby" },
  { prov = "perl", path = "/usr/bin/perl" },
  { prov = "python3",  path = "/home/sravioli/.py-nvim/bin/python3" }
}
for _, provider in ipairs(providers) do
  let["loaded_" .. provider.prov .. "_provider"] = nil
  let[provider.prov .. "_host_prog"] = provider.path
end
