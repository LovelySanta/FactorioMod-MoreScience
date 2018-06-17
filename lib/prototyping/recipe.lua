if not MoreScience.lib.recipe then MoreScience.lib.recipe = {}


  local function recipePrototypeCleanup(recipeName)
    if not data.raw["recipe"][recipeName] then return end

    -- clean up recipe becose other mods...
    if data.raw["recipe"][recipeName].normal or data.raw["recipe"][recipeName].expensive then
      data.raw["recipe"][recipeName].ingredients = nil
      data.raw["recipe"][recipeName].energy_required = nil
    end
  end



  function MoreScience.lib.recipe.isEnabled(recipe)
    if not data.raw["recipe"][recipe] then return nil end
    recipePrototypeCleanup(recipe)

    local normalEnabled = false
    local expensiveEnabled = false
    if data.raw["recipe"][recipe].normal then
      if not ((data.raw["recipe"][recipe].normal.enabled == false) or (data.raw["recipe"][recipe].normal.enabled == "false")) then
        if not data.raw["recipe"][recipe].expensive then -- if no expensive recipe is enabled, it will fall back to normal
          return {true, true}
        end
        normalEnabled = true
      end
    end

    if data.raw["recipe"][recipe].expensive then
      if not ((data.raw["recipe"][recipe].expensive.enabled == false) or (data.raw["recipe"][recipe].expensive.enabled == "false")) then
        if not data.raw["recipe"][recipe].normal then -- if no normal recipe is enabled, it will fall back to expensive
          return {true, true}
        end
        expensiveEnabled = true
      end
    end

    if data.raw["recipe"][recipe].normal or data.raw["recipe"][recipe].expensive then return {normalEnabled, expensiveEnabled} end

    if (data.raw["recipe"][recipe].enabled == false) or (data.raw["recipe"][recipe].enabled == "false") then
      return {false, false}
    else
      return {true, true}
    end
  end



  function MoreScience.lib.recipe.enable(recipe)
    if not data.raw["recipe"][recipe] then return end
    recipePrototypeCleanup(recipe)

    if data.raw["recipe"][recipe].normal then
      data.raw["recipe"][recipe].normal.enabled = true
    end

    if data.raw["recipe"][recipe].expensive then
      data.raw["recipe"][recipe].expensive.enabled = true
    end

    if data.raw["recipe"][recipe].enabled == false then
      data.raw["recipe"][recipe].enabled = true
    end
  end



  function MoreScience.lib.recipe.disable(recipe)
    if not data.raw["recipe"][recipe] then return end
    recipePrototypeCleanup(recipe)

    if data.raw["recipe"][recipe].normal then
      data.raw["recipe"][recipe].normal.enabled = false
    end

    if data.raw["recipe"][recipe].expensive then
      data.raw["recipe"][recipe].expensive.enabled = false
    end

    if not (data.raw["recipe"][recipe].normal or data.raw["recipe"][recipe].expensive) then
      data.raw["recipe"][recipe].enabled = false
    end
  end



  function MoreScience.lib.recipe.addIngredient(recipeName, itemName, itemAmount, itemType)
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



  function MoreScience.lib.recipe.removeIngredient(recipeName, ingredientName)
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



  function MoreScience.lib.recipe.editIngredient(recipeName, oldIngredientName, newIngredientName, amountMultiplier)
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



  function MoreScience.lib.recipe.setResultCount(recipeName, resultName, resultAmount)

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



  function MoreScience.lib.recipe.setEngergyRequired(recipeName, energyRequired)
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].ingredients then
      data.raw["recipe"][recipeName].energy_required = energyRequired
    end

    if data.raw["recipe"][recipeName].normal then
      data.raw["recipe"][recipeName].normal.energy_required = energyRequired
    end

    if data.raw["recipe"][recipeName].expensive then
      data.raw["recipe"][recipeName].expensive.energy_required = energyRequired
    end

  end

end -- end of MoreScience.lib.recipe
