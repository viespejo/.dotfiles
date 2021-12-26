local dap, dapui = require("dap"), require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>", "za"},
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      { id = "stacks", size = 0.40 },
      { id = "breakpoints", size = 0.30 },
      { id = "watches", size = 00.30 },
    },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 60,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

dap.listeners.after['event_initialized']["dapui_config"] = function()
  -- dapui.open('tray')
  print('Session started')
end
dap.listeners.before['command_disconnect']['dapui_config'] = function()
  dapui.close()
  print('Session terminated')
end
