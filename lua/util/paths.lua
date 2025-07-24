-- lua/util/paths.lua
local M = {}

-- Get the Python interpreter path based on the current project setup
function M.get_python_path()
  local cwd = vim.fn.getcwd()
  if vim.loop.fs_stat(cwd .. "/uv.lock") then
    return cwd .. "/.venv/bin/python"
  elseif vim.loop.fs_stat(cwd .. "/poetry.lock") then
    return cwd .. "/.venv/bin/python"
  end
  return "python3"
end

-- Get current file's full absolute path
function M.get_current_file_path()
  return vim.fn.expand("%:p")
end

-- Get module name (e.g. path/to/file.py -> path.to.file)
function M.get_module_name()
  local full_path = M.get_current_file_path()
  local root = vim.fn.getcwd()
  local rel_path = full_path:sub(#root + 2)
  return rel_path:gsub("%.py$", ""):gsub("/", ".")
end

-- Shell escape a string
function M.shellescape(str)
  return vim.fn.shellescape(str)
end

return M
