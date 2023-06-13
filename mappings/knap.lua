return {
  n = {
    ["<F5>"] = { ":lua require('knap').processes_once()<CR>", "Process document with Knap" },
    ["<F6>"] = { ":lua require('knap').close_viewer()<CR>", "Close Knap document" },
    ["<F7>"] = { ":lua require('knap').toggle_autopreviewing()<CR>", "Toggle Knap auto-previewing" },
    ["<F9>"] = { ":lua require('knap').forward_jump()<CR>", "Invoke SyncTeX forward search" },
  },
  v = {
    ["<F5>"] = { ":lua require('knap').processes_once()<CR>", "Process document with Knap" },
    ["<F6>"] = { ":lua require('knap').close_viewer()<CR>", "Close Knap document" },
    ["<F7>"] = { ":lua require('knap').toggle_autopreviewing()<CR>", "Toggle Knap auto-previewing" },
    ["<F9>"] = { ":lua require('knap').forward_jump()<CR>", "Invoke SyncTeX forward search" },
  },
  i = {
    ["<F5>"] = { ":lua require('knap').processes_once()<CR>", "Process document with Knap" },
    ["<F6>"] = { ":lua require('knap').close_viewer()<CR>", "Close Knap document" },
    ["<F7>"] = { ":lua require('knap').toggle_autopreviewing()<CR>", "Toggle Knap auto-previewing" },
    ["<F9>"] = { ":lua require('knap').forward_jump()<CR>", "Invoke SyncTeX forward search" },
  },
}
