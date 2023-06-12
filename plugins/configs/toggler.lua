local present, toggler = pcall(require, "nvim-toggler")
if not present then
  return
end

toggler.setup {
  -- your own inverses
  inverses = {
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["vim"] = "emacs",
    ["TD"] = "LR",
    ["input"] = "output",
    ["enable"] = "disable",
    ["east"] = "ovest",
    ["north"] = "south",
    ["sì"] = "no",
    ["AND"] = "OR",
    ["begin"] = "end",
    ["up"] = "down",
    ["left"] = "right",
    ["software"] = "hardware",
    ["for"] = "while",
    ["int"] = "float",
    ["=="] = "!=",
    [">"] = "<",
    ["+"] = "-",
    ["*"] = "/",
    [","] = ";",
    ["."] = ":",
    ["min"] = "max",
    ["minimum"] = "maximum",
  },
  -- removes the default <leader>i keymap
  remove_default_keybinds = false,
  -- removes the default set of inverses
  remove_default_inverses = false,
}
