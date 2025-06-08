local M = {}

M.run_with_input = function()
  -- Get the current file's extension to decide whether it's Rust or C++
  local file_extension = vim.fn.expand("%:e")

  -- Get the project's root directory
  local project_root = vim.fn.getcwd()

  -- Set up the command to run based on the file type
  local cmd = ""

  if file_extension == "rs" then
    -- For Rust, run `cargo run` with input redirection
    cmd = "cd " .. project_root .. " && cargo run < input.txt"
  elseif file_extension == "cpp" then
    -- For C++, compile with `g++` and then run the executable
    cmd = "cd " .. project_root .. " && g++ -o a.out *.cpp && ./a.out < input.txt"
  else
    -- Print an error message if the file is neither Rust nor C++
    vim.api.nvim_err_writeln("Unsupported file type for running with input.")
    return
  end

  -- Open a floating terminal
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new unlisted buffer
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Start a terminal in the floating window
  vim.fn.termopen(cmd)

  -- Switch to terminal insert mode
  vim.cmd("startinsert")
end

-- Map the function to a keybind in normal mode
vim.keymap.set("n", "<leader>i", M.run_with_input, {
  noremap = true,
  silent = true,
  desc = "Run project with input.txt in a floating terminal (Rust or C++)",
})

return M
