require'nvim-web-devicons'.setup {
  strict = true;
  override_by_filename = {
   [".gitignore"] = {
     icon = "",
     color = "#f1502f",
     name = "Gitignore"
   },
   [".lua"] = {
     icon = ".--",
     color = "#f1502f",
     name = "lua"
   }
 };
}
