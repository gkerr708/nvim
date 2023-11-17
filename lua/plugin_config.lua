require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
   folder = {
     icon = "x",
     color = "#428850",
     cterm_color = "65",
     name = "myFolderIcon"}
  };
  color_icons = true;
  default = true;
  strict = true;
  override_by_filename = {
   [".gitignore"] = {
     icon = "",
     color = "#f1502f",
     name = "Gitignore"
   },
   [".lua"] = {
     icon = "0",
     color = "#f1502f",
     name = "lua"
   }
 };
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}
