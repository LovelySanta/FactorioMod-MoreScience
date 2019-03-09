
if not MoreScience.lib.module then MoreScience.lib.module = {}

  function MoreScience.lib.module.allowModuleOnRecipe(moduleNames, recipeToAdd)

    if MoreScience.lib.table.isTable(moduleNames) then
      for _,moduleName in pairs(moduleNames) do
        MoreScience.lib.module.allowModuleOnRecipe(moduleName, recipeToAdd)
      end

    else
      if not data.raw["recipe"][recipeToAdd] then
        MoreScience.lib.debug.log(string.format("WARNING: Tried allowing %q on recipe %q, but the recipe doesn't exist.", moduleNames, recipeToAdd))
        return
      end

      if not data.raw["module"][moduleNames] then
        MoreScience.lib.debug.log(string.format("WARNING: Tried adding recipe %q to %q, but that module doesn't exist.", recipeToAdd, moduleNames))
        return
      end

      data.raw["module"][moduleNames].limitation = data.raw["module"][moduleNames].limitation or {}
      for _,recipeName in pairs(data.raw["module"][moduleNames].limitation) do
        if recipeName == recipeToAdd then
          MoreScience.lib.debug.log(string.format("WARNING: Tried adding recipe %q to %q, but that recipe was already present.", recipeToAdd, moduleNames))
          return
        end
      end

      table.insert(data.raw["module"][moduleNames].limitation, recipeToAdd)
    end
  end



  function MoreScience.lib.module.removeModuleFromRecipe(moduleNames, recipeToRemove)

    if MoreScience.lib.table.isTable(moduleNames) then
      for _,moduleName in pairs(moduleNames) do
        MoreScience.lib.module.removeModuleFromRecipe(moduleName, recipeToRemove)
      end

    else
      if not data.raw["recipe"][recipeToRemove] then
        MoreScience.lib.debug.log(string.format("WARNING: Tried removing %q on recipe %q, but the recipe doesn't exist.", moduleNames, recipeToRemove))
        return
      end

      if not data.raw["module"][moduleNames] then
        MoreScience.lib.debug.log(string.format("WARNING: Tried removing recipe %q to %q, but that module doesn't exist.", recipeToRemove, moduleNames))
        return
      end

      data.raw["module"][moduleNames].limitation = data.raw["module"][moduleNames].limitation or {}
      for recipeIndex,recipeName in pairs(data.raw["module"][moduleNames].limitation) do
        if recipeName == recipeToRemove then
          table.remove(data.raw["module"][moduleNames].limitation, recipeIndex)
          return -- return if removed
        end
      end

      MoreScience.lib.debug.log(string.format("WARNING: Tried removing recipe %q to %q, but that recipe was not present.", recipeToRemove, moduleNames))

    end
  end

end
