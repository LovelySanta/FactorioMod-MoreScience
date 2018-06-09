function removePrerequisiteTechnology(technologyName, prerequisiteToRemove)
  if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].prerequisites then
    for index, prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
      if prerequisite == prerequisiteToRemove then
        table.remove(data.raw["technology"][technologyName].prerequisites, index)
        if #data.raw["technology"][technologyName].prerequisites == 0 then
          data.raw["technology"][technologyName].prerequisites = nil
        end
        break
      end
    end
  end
end



function addPrerequisiteTechnology(technologyName, prerequisiteToAdd)
  if data.raw["technology"][technologyName] then
    if not data.raw["technology"][technologyName].prerequisites then
      data.raw["technology"][technologyName].prerequisites = {}
    end
    for index, prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
      if prerequisite == prerequisiteToAdd then
        log("WARNING: Tried adding prerequisite \'" .. prerequisiteToAdd .. "\' to \'" .. technologyName .. "\' which was already present.")
        return
      end
    end
    table.insert(data.raw["technology"][technologyName].prerequisites, prerequisiteToAdd)
  end
end



function removeRecipeUnlock(technologyName, recipeToRemove)
  if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].effects then
    for index, effect in pairs(data.raw["technology"][technologyName].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipeToRemove then
        table.remove(data.raw["technology"][technologyName].effects, index)
        if #data.raw["technology"][technologyName].effects == 0 then
          data.raw["technology"][technologyName].effects = nil
        end
        break
      end
    end
  end
end



function addRecipeUnlock(technologyName, recipeToAdd)
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



function removeScienceIngredient(technologyName, sciencePackName)
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



function addScienceIngredient(technologyName, sciencePackAmount, sciencePackName)
  if data.raw["technology"][technologyName] and data.raw["technology"][technologyName].unit.ingredients then
    for index, ingredient in pairs(data.raw["technology"][technologyName].unit.ingredients) do
      if ingredient[1] == sciencePackName then
        log("WARNING: Tried adding ingredient \'" .. sciencePackName .. "\' to \'" .. technologyName .. "\' which was already present. Increased amount instead.")
        data.raw["technology"][technologyName].unit.ingredients[index][2] = ingredient[2] + sciencePackAmount
        return
      end
    end
    table.insert(data.raw["technology"][technologyName].unit.ingredients, {sciencePackName, sciencePackAmount})
  end
end



local function recipePrototypeCleanup(recipeName)
  -- clean up recipe becose other mods...
  if data.raw["recipe"][recipeName].normal or data.raw["recipe"][recipeName].expensive then
    data.raw["recipe"][recipeName].ingredients = nil
    data.raw["recipe"][recipeName].energy_required = nil
  end
end



function disableRecipe(recipe)
   if not data.raw.recipe[recipe] then return end
   recipePrototypeCleanup(recipe)

   if data.raw["recipe"][recipe].normal then
      data.raw["recipe"][recipe].normal.enabled = false
      data.raw["recipe"][recipe].expensive.enabled = false
   else
      data.raw["recipe"][recipe].enabled = false
   end
end



function addRecipeIngredient(recipeName, itemName, itemAmount, itemType)
  if not data.raw["recipe"][recipeName] then return end
  recipePrototypeCleanup(recipeName)

  if data.raw["recipe"][recipeName].ingredients then
    table.insert(data.raw["recipe"][recipeName].ingredients, {["type"] = itemType, ["name"] = itemName, ["amount"] = itemAmount})
  end

  if data.raw["recipe"][recipeName].normal then
    table.insert(data.raw["recipe"][recipeName].normal.ingredients, {["type"] = itemType, ["name"] = itemName, ["amount"] = itemAmount})
  end

  if data.raw["recipe"][recipeName].expensive then
    table.insert(data.raw["recipe"][recipeName].expensive.ingredients, {["type"] = itemType, ["name"] = itemName, ["amount"] = itemAmount})
  end

end



function removeRecipeIngredient(recipeName, ingredientName)
  if not data.raw["recipe"][recipeName] then return end
  recipePrototypeCleanup(recipeName)

  if data.raw["recipe"][recipeName].ingredients then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].ingredients) do
      if (ingredient.name and ingredient.name == ingredientName) or (ingredient[1] and ingredient[1] == ingredientName) then
        table.remove(data.raw["recipe"][recipeName].ingredients, index)
        break
      end
    end
  end

  if data.raw["recipe"][recipeName].normal then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].normal.ingredients) do
      if (ingredient.name and ingredient.name == ingredientName) or (ingredient[1] and ingredient[1] == ingredientName) then
        table.remove(data.raw["recipe"][recipeName].normal.ingredients, index)
        break
      end
    end
  end

  if data.raw["recipe"][recipeName].expensive then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].expensive.ingredients) do
      if (ingredient.name and ingredient.name == ingredientName) or (ingredient[1] and ingredient[1] == ingredientName) then
        table.remove(data.raw["recipe"][recipeName].expensive.ingredients, index)
        break
      end
    end
  end

end



function editRecipeIngredient(recipeName, oldIngredientName, newIngredientName, amountMultiplier)
  if not data.raw["recipe"][recipeName] then return end
  recipePrototypeCleanup(recipeName)

  if data.raw["recipe"][recipeName].ingredients then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].ingredients) do
      if ingredient.name and ingredient.name == oldIngredientName then
        data.raw["recipe"][recipeName].ingredients[index].name = newIngredientName
        data.raw["recipe"][recipeName].ingredients[index].amount = math.floor(.5 + data.raw["recipe"][recipeName].ingredients[index].amount * amountMultiplier)
        break
      elseif ingredient[1] and ingredient[1] == oldIngredientName then
        data.raw["recipe"][recipeName].ingredients[index][1] = newIngredientName
        data.raw["recipe"][recipeName].ingredients[index][2] = math.floor(.5 + data.raw["recipe"][recipeName].ingredients[index][2] * amountMultiplier)
        break
      end
    end
  end

  if data.raw["recipe"][recipeName].normal then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].normal.ingredients) do
      if ingredient.name and ingredient.name == oldIngredientName then
        data.raw["recipe"][recipeName].normal.ingredients[index].name = newIngredientName
        data.raw["recipe"][recipeName].normal.ingredients[index].amount = math.floor(.5 + data.raw["recipe"][recipeName].normal.ingredients[index].amount * amountMultiplier)
        break
      elseif ingredient[1] and ingredient[1] == oldIngredientName then
        data.raw["recipe"][recipeName].normal.ingredients[index][1] = newIngredientName
        data.raw["recipe"][recipeName].normal.ingredients[index][2] = math.floor(.5 + data.raw["recipe"][recipeName].normal.ingredients[index][2] * amountMultiplier)
        break
      end
    end
  end

  if data.raw["recipe"][recipeName].expensive then
    for index, ingredient in pairs(data.raw["recipe"][recipeName].expensive.ingredients) do
      if ingredient.name and ingredient.name == oldIngredientName then
        data.raw["recipe"][recipeName].expensive.ingredients[index].name = newIngredientName
        data.raw["recipe"][recipeName].expensive.ingredients[index].amount = math.floor(.5 + data.raw["recipe"][recipeName].expensive.ingredients[index].amount * amountMultiplier)
        break
      elseif ingredient[1] and ingredient[1] == oldIngredientName then
        data.raw["recipe"][recipeName].expensive.ingredients[index][1] = newIngredientName
        data.raw["recipe"][recipeName].expensive.ingredients[index][2] = math.floor(.5 + data.raw["recipe"][recipeName].expensive.ingredients[index][2] * amountMultiplier)
        break
      end
    end
  end
end



function setRecipeResultCount(recipeName, resultName, resultAmount)

  if data.raw["recipe"][recipeName].normal then
    if data.raw["recipe"][recipeName].normal.results then
      for index, result in pairs(data.raw["recipe"][recipeName].normal.results) do
        if result.name == resultName then
          result.amount = resultAmount
          break
        end
      end
    end
  end

  if data.raw["recipe"][recipeName].expensive then
    if data.raw["recipe"][recipeName].expensive.results then
      for index, result in pairs(data.raw["recipe"][recipeName].expensive.results) do
        if result.name == resultName then
          result.amount = resultAmount
          break
        end
      end
    end
  end

end



function setRecipeEngergyRequired(recipeName, energyRequired)
  recipePrototypeCleanup(recipeName)

  if data.raw["recipe"][recipeName].normal then
    data.raw["recipe"][recipeName].normal.energy_required = energyRequired
  end

  if data.raw["recipe"][recipeName].expensive then
    data.raw["recipe"][recipeName].expensive.energy_required = energyRequired
  end

end
