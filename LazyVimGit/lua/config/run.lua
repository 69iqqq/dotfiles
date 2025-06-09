local M = {}

M.run_with_input = function()
  local file_extension = vim.fn.expand("%:e")
  local project_root = vim.fn.getcwd()
  local input_path = project_root .. "/input.txt"

  -- Check if input.txt exists and is non-empty
  local input_exists = vim.loop.fs_stat(input_path) ~= nil
  local input_nonempty = false
  if input_exists then
    local stat = vim.loop.fs_stat(input_path)
    if stat and stat.size > 0 then
      input_nonempty = true
    end
  end

  local cmd = ""

  if file_extension == "rs" then
    -- Use input.txt only if it exists and non-empty
    if input_nonempty then
      cmd = "cd " .. project_root .. " && cargo run < input.txt"
    else
      cmd = "cd " .. project_root .. " && cargo run"
    end
  elseif file_extension == "cpp" then
    if input_nonempty then
      cmd = "cd " .. project_root .. " && g++ -o a.out *.cpp && ./a.out < input.txt"
    else
      cmd = "cd " .. project_root .. " && g++ -o a.out *.cpp && ./a.out"
    end
  else
    vim.api.nvim_err_writeln("Unsupported file type for running with input.")
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
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

  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>i", M.run_with_input, {
  noremap = true,
  silent = true,
  desc = "Run project with input.txt in a floating terminal (Rust or C++)",
})

return M
