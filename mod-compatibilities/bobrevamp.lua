
if mods["bobrevamp"] then
  log("Mod compatibility with bobrevamp update")
  -- Remove chemical plant recipe unlock
  MoreScience.lib.technology.removeRecipeUnlock("chemical-plant", "chemical-plant")
end
