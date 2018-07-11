require('util')

if not MoreScience.lib.technology then MoreScience.lib.technology = {}

  function MoreScience.lib.technology.disable(technologyName, prerequisiteToRemove)
    if not data.raw["technology"][technologyName] then return end
      data.raw["technology"][technologyName].enabled = false
  end



  function MoreScience.lib.technology.removePrerequisite(technologyName, prerequisiteToRemove)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].prerequisites then
      for index, prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
        if prerequisite == prerequisiteToRemove then
          table.remove(data.raw["technology"][technologyName].prerequisites, index)
          if table_size(data.raw["technology"][technologyName].prerequisites) == 0 then
            data.raw["technology"][technologyName].prerequisites = nil
          end
          break
        end
      end
    end
  end



  function MoreScience.lib.technology.addPrerequisite(technologyName, prerequisiteToAdd)
    if data.raw["technology"][technologyName] then
      if not data.raw["technology"][technologyName].prerequisites then
        data.raw["technology"][technologyName].prerequisites = {}
      end
      for index, prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
        if prerequisite == prerequisiteToAdd then
          MoreScience.lib.debug.log(string.format("WARNING: Tried adding prerequisite %q to %q which was already present.", prerequisiteToAdd, technologyName))
          return
        end
      end
      table.insert(data.raw["technology"][technologyName].prerequisites, prerequisiteToAdd)
    end
  end



  function MoreScience.lib.technology.movePrerequisite(technologyName, oldPrerequisite, newPrerequisite)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].prerequisites then
      local moved = false
      for index, prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
        if prerequisite == oldPrerequisite then
          data.raw["technology"][technologyName].prerequisites[index] = newPrerequisite
          moved = true
          break
        end
      end
      if not moved then
        MoreScience.lib.debug.log(string.format("WARNING: Could not change %q in research %q to %q. Adding it instead.", oldPrerequisite, technologyName, newPrerequisite))
        addPrerequisiteTechnology(technologyName, newPrerequisite)
      end
    end
  end



  function MoreScience.lib.technology.removeRecipeUnlock(technologyName, recipeToRemove)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].effects then
      for index, effect in pairs(data.raw["technology"][technologyName].effects) do
        if effect.type == "unlock-recipe" and effect.recipe == recipeToRemove then
          table.remove(data.raw["technology"][technologyName].effects, index)
          if table_size(data.raw["technology"][technologyName].effects) == 0 then
            data.raw["technology"][technologyName].effects = nil
          end
          break
        end
      end
    end
  end



  function MoreScience.lib.technology.addRecipeUnlock(technologyName, recipeToAdd)
    if data.raw["technology"][technologyName] then
      if not data.raw["technology"][technologyName].effects then
        data.raw["technology"][technologyName].effects = {}
      end
      for index, effect in pairs(data.raw["technology"][technologyName].effects) do
        if effect.type == "unlock-recipe" and effect.recipe == recipeToAdd then
          return
        end
      end
      table.insert(data.raw["technology"][technologyName].effects, {type = "unlock-recipe", recipe = recipeToAdd})
    end
  end



  function MoreScience.lib.technology.removeIngredient(technologyName, sciencePackName)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].unit.ingredients then
      for index, ingredient in pairs(data.raw["technology"][technologyName].unit.ingredients) do
        if ingredient[1] == sciencePackName then
          table.remove(data.raw["technology"][technologyName].unit.ingredients, index)
          if #data.raw["technology"][technologyName].unit.ingredients == 0 then
            data.raw["technology"][technologyName].unit.ingredients = nil
          end
          break
        end
      end
    end
  end



  function MoreScience.lib.technology.addIngredient(technologyName, sciencePackAmount, sciencePackName)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].unit.ingredients then
      for index, ingredient in pairs(data.raw["technology"][technologyName].unit.ingredients) do
        if ingredient[1] == sciencePackName then
          MoreScience.lib.debug.log(string.format("WARNING: Tried adding ingredient %q to %q which was already present. Increased amount instead.", sciencePackName, technologyName))
          data.raw["technology"][technologyName].unit.ingredients[index][2] = ingredient[2] + sciencePackAmount
          return
        end
      end
      table.insert(data.raw["technology"][technologyName].unit.ingredients, {sciencePackName, sciencePackAmount})
    end
  end



  function MoreScience.lib.technology.changeCount(technologyName, amount)
    if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].unit.count then
      data.raw["technology"][technologyName].unit.count = amount
    end
  end



  function MoreScience.lib.technology.getAllPrerequisites(technologyName)
    if not data.raw["technology"][technologyName] then return nil end
    if not data.raw["technology"][technologyName].prerequisites then return nil end

    if MoreScience.lib.technology.prereqcache[technologyName] then return MoreScience.lib.technology.prereqcache[technologyName] end

    -- temporary till we find all prerequisites (this is to prevent loop, stack overflow)
    MoreScience.lib.technology.prereqcache[technologyName] = util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)

    -- get all none-reduntant prerequisites now
    local prerequisites = util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)
    for _,prerequisiteName in pairs(data.raw["technology"][technologyName].prerequisites) do
      local prerequisiteTable = MoreScience.lib.technology.getAllPrerequisites(prerequisiteName)
      if prerequisiteTable then
        for _, prerequisite in pairs(prerequisiteTable) do
          table.insert(prerequisites, prerequisite)
        end
      end
    end

    -- save all the none-redundant prerequisites now
    MoreScience.lib.technology.prereqcache[technologyName] = prerequisites
    return prerequisites
  end



  function MoreScience.lib.technology.removeRedundantPrerequisites(technologyName)
    if not data.raw["technology"][technologyName].prerequisites then return end

    -- iterate over all prerequisites to check if they are redundant
    for _,prerequisiteName in pairs(util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)) do

      -- STEP 1: obtain the prerequisites of a prerequisite
      local prerequisites = MoreScience.lib.technology.getAllPrerequisites(prerequisiteName)
      if prerequisites then

        -- STEP 2a: check for all the other prerequisites of the technology
        for _,prerequisite in pairs(util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)) do
          if prerequisite ~= prerequisiteName then -- no need to check itself

            -- STEP 2b: remove the technology prerequisite if the prerequisite is a prerequisite of another technology prerequisite
            for _, name in pairs(prerequisites) do
              if name == prerequisite then
                --remove prerequisite
                for k,v in pairs(data.raw["technology"][technologyName].prerequisites) do
                  if v == prerequisite then
                    table.remove(data.raw["technology"][technologyName].prerequisites, k)
                    MoreScience.lib.debug.log(string.format("TechTreeCleanup: Removing prerequisite %q from technology %q.", prerequisite, technologyName))
                  end
                end
              end
            end
          end
        end
      end
    end
  end



  function MoreScience.lib.technology.removeAllRedundantPrerequisites()
    if not MoreScience.lib.technology.prereqcache then
      MoreScience.lib.technology.prereqcache = {}
    end

    for _, technology in pairs(data.raw["technology"]) do
      MoreScience.lib.technology.removeRedundantPrerequisites(technology.name)
    end

    MoreScience.lib.technology.prereqcache = nil
  end



end -- end of MoreScience.lib.technology
