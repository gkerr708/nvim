-- lua/util/paths.lua
local M = {}

-- Get Poetry environment Python path
function M.get_poetry_python_path()
  local handle = io.popen("poetry env info -p 2>/dev/null")
  if not handle then return nil end

  local path = handle:read("*a"):gsub("%s+", "")
  handle:close()

  if path ~= "" and vim.fn.isdirectory(path) == 1 then
    return path .. "/bin/python"
  end
  return nil
end


function M.get_python_path()
  local cwd = M.get_git_root()
  local uv_lock = cwd .. "/uv.lock"
  local poetry_lock = cwd .. "/poetry.lock"
  -- Check for uv virtual environment
  if vim.loop.fs_stat(uv_lock) then
    return cwd .. "/.venv/bin/python"
  end
  -- Check for poetry virtual environment
  if vim.loop.fs_stat(poetry_lock) then
    return cwd .. "/.venv/bin/python"
  end
  return "python3"
end

-- Get the root directory of the current Git repository
function M.get_git_root()
  -- Attempt to locate the nearest ".git" directory by searching upward
  -- from the current file's directory (expanded path of current buffer)
  -- The `finddir` function returns the path to the .git directory if found
  local root = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")

  -- If no .git directory is found, fallback to the current working directory
  if root == "" then
    return vim.fn.getcwd()
  end

  -- Return the absolute path to the Git root directory
  return root
end

-- Get current file's full absolute path
function M.get_current_file_path()
  return vim.fn.expand("%:p")
end

-- Get module name (e.g. path/to/file.py -> path.to.file)
function M.get_module_name()
  local full_path = M.get_current_file_path()
  local root = M.get_git_root()
  local rel_path = full_path:sub(#root + 2)
  return rel_path:gsub("%.py$", ""):gsub("/", ".")
end

-- Shell escape a string
function M.shellescape(str)
  return vim.fn.shellescape(str)
end

return M
