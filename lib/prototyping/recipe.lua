require('lib/utilities/log')
require('lib/prototyping/item')
if not MoreScience.lib.recipe then MoreScience.lib.recipe = {}

  local function recipePrototypeCleanup(recipeName)
    if not data.raw["recipe"][recipeName] then return end
    if (not data.raw["recipe"][recipeName].normal) and (not data.raw["recipe"][recipeName].expensive) then return end

    -- clean up recipe becose other mods...
    for _, key in pairs({
      "ingredients",
      "energy_required",
    }) do
      if ( data.raw["recipe"][recipeName].normal    and data.raw["recipe"][recipeName].normal[key]    ) or
         ( data.raw["recipe"][recipeName].expensive and data.raw["recipe"][recipeName].expensive[key] ) then
        data.raw["recipe"][recipeName][key] = nil
      end
    end
  end



  function MoreScience.lib.recipe.create(recipeName)
    data:extend{{
      type = "recipe",
      name = recipeName,
      ingredients = {},
      results = {}
    }}
  end



  function MoreScience.lib.recipe.duplicate(recipeName, newRecipeName)
    if not data.raw["recipe"][recipeName] then
      MoreScience.lib.recipe.create(newRecipeName)
    end

    local copy = util.table.deepcopy(data.raw["recipe"][recipeName])
    copy.name = newRecipeName
    data:extend{copy}
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



  function MoreScience.lib.recipe.setCraftingCategory(recipe, category)
    if not data.raw["recipe"][recipe] then return end

    data.raw["recipe"][recipe].category = category
  end



  function MoreScience.lib.recipe.addIngredient(recipeName, ingredientName, ingredientAmount, ingredientType)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].ingredients then
      table.insert(data.raw["recipe"][recipeName].ingredients, {
        ["type"] = ingredientType,
        ["name"] = ingredientName,
        ["amount"] = ingredientAmount
      })
    end

    if data.raw["recipe"][recipeName].normal then
      table.insert(data.raw["recipe"][recipeName].normal.ingredients, {
        ["type"] = ingredientType,
        ["name"] = ingredientName,
        ["amount"] = ingredientAmount
      })
    end

    if data.raw["recipe"][recipeName].expensive then
      table.insert(data.raw["recipe"][recipeName].expensive.ingredients, {
        ["type"] = ingredientType,
        ["name"] = ingredientName,
        ["amount"] = ingredientAmount
      })
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



  function MoreScience.lib.recipe.addResult(recipeName, resultName, resultAmount, resultType)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].result then
      data.raw["recipe"][recipeName].results = {{
        ["name"] = data.raw["recipe"][recipeName].result,
        ["amount"] = data.raw["recipe"][recipeName].result_count or 1,
      }}
      data.raw["recipe"][recipeName].result = nil
      data.raw["recipe"][recipeName].result_count = nil
    end

    if data.raw["recipe"][recipeName].results then
      local alreadyPresent = false
      for _, result in pairs(data.raw["recipe"][recipeName].results) do
        if result.name == resultName then
          result.amount = result.amount + resultAmount
          MoreScience.lib.debug.log(string.format("WARNING: Tried adding result %q to recipe %q which was already present, increasing count instead.", resultName, recipeName))
          alreadyPresent = true
          break
        end
      end
      if not alreadyPresent then
        table.insert(data.raw["recipe"][recipeName].results, {
          ["type"] = resultType,
          ["name"] = resultName,
          ["amount"] = resultAmount,
        })
      end
    end

    if data.raw["recipe"][recipeName].normal then
      if data.raw["recipe"][recipeName].normal.result then
        data.raw["recipe"][recipeName].normal.results = {{
          ["name"] = data.raw["recipe"][recipeName].normal.result,
          ["amount"] = data.raw["recipe"][recipeName].normal.result_count or 1,
        }}
        data.raw["recipe"][recipeName].normal.result = nil
        data.raw["recipe"][recipeName].normal.result_count = nil
      end

      if data.raw["recipe"][recipeName].normal.results then
        local alreadyPresent = false
        for _, result in pairs(data.raw["recipe"][recipeName].normal.results) do
          if result.name == resultName then
            result.amount = result.amount + resultAmount
            MoreScience.lib.debug.log(string.format("WARNING: Tried adding result %q to recipe %q which was already present, increasing count instead.", resultName, recipeName))
            alreadyPresent = true
            break
          end
        end
        if not alreadyPresent then
          table.insert(data.raw["recipe"][recipeName].normal.results, {
            ["type"] = resultType,
            ["name"] = resultName,
            ["amount"] = resultAmount,
          })
        end
      end
    end

    if data.raw["recipe"][recipeName].expensive then
      if data.raw["recipe"][recipeName].expensive.result then
        data.raw["recipe"][recipeName].expensive.results = {{
          ["name"] = data.raw["recipe"][recipeName].expensive.result,
          ["amount"] = data.raw["recipe"][recipeName].expensive.result_count or 1,
        }}
        data.raw["recipe"][recipeName].expensive.result = nil
        data.raw["recipe"][recipeName].expensive.result_count = nil
      end

      if data.raw["recipe"][recipeName].expensive.results then
        local alreadyPresent = false
        for _, result in pairs(data.raw["recipe"][recipeName].expensive.results) do
          if result.name == resultName then
            result.amount = result.amount + resultAmount
            MoreScience.lib.debug.log(string.format("WARNING: Tried adding result %q to recipe %q which was already present, increasing count instead.", resultName, recipeName))
            alreadyPresent = true
            break
          end
        end
        if not alreadyPresent then
          table.insert(data.raw["recipe"][recipeName].expensive.results, {
            ["type"] = resultType,
            ["name"] = resultName,
            ["amount"] = resultAmount,
          })
        end
      end
    end

  end



  function MoreScience.lib.recipe.editResult(recipeName, oldResultName, newResultName, amountMultiplier)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].result and data.raw["recipe"][recipeName].result == oldResultName then
      data.raw["recipe"][recipeName].result = newResultName
      data.raw["recipe"][recipeName].result_count = (data.raw["recipe"][recipeName].result_count or 1) * amountMultiplier
    end

    if data.raw["recipe"][recipeName].results then
      for index, result in pairs(data.raw["recipe"][recipeName].results) do
        if result.name == oldResultName then
          result.name = newResultName

          if result.amount then
            result.amount = result.amount * amountMultiplier
          end
          if result.amount_min then
            result.amount_min = result.amount_min * amountMultiplier
          end
          if result.amount_max then
            result.amount_max = result.amount_max * amountMultiplier
          end

          break
        end
      end
    end

    if data.raw["recipe"][recipeName].normal then
      if data.raw["recipe"][recipeName].normal.results then
        for index, result in pairs(data.raw["recipe"][recipeName].normal.results) do
          if result.name == oldResultName then
            result.name = newResultName

            if result.amount then
              result.amount = result.amount * amountMultiplier
            end
            if result.amount_min then
              result.amount_min = result.amount_min * amountMultiplier
            end
            if result.amount_max then
              result.amount_max = result.amount_max * amountMultiplier
            end

            break
          end
        end
      end
    end

    if data.raw["recipe"][recipeName].expensive then
      if data.raw["recipe"][recipeName].expensive.results then
        for index, result in pairs(data.raw["recipe"][recipeName].expensive.results) do
          if result.name == oldResultName then
            result.name = newResultName

            if result.amount then
              result.amount = result.amount * amountMultiplier
            end
            if result.amount_min then
              result.amount_min = result.amount_min * amountMultiplier
            end
            if result.amount_max then
              result.amount_max = result.amount_max * amountMultiplier
            end

            break
          end
        end
      end
    end

  end



  function MoreScience.lib.recipe.setResultCount(recipeName, resultName, resultAmount)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].result then
      data.raw["recipe"][recipeName].result_count = resultAmount
    end

    if data.raw["recipe"][recipeName].results then
      for index, result in pairs(data.raw["recipe"][recipeName].results) do
        if result.name == resultName then
          result.amount = resultAmount
          result.amount_min = nil
          result.amount_max = nil
          break
        end
      end
    end

    if data.raw["recipe"][recipeName].normal then
      if data.raw["recipe"][recipeName].normal.results then
        for index, result in pairs(data.raw["recipe"][recipeName].normal.results) do
          if result.name == resultName then
            result.amount = resultAmount
            result.amount_min = nil
            result.amount_max = nil
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
            result.amount_min = nil
            result.amount_max = nil
            break
          end
        end
      end
    end

  end



  function MoreScience.lib.recipe.setResultProbability(recipeName, resultName, resultProbability)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    resultProbability = ((resultProbability~=1) and resultProbability)

    if data.raw["recipe"][recipeName].result then
      data.raw["recipe"][recipeName].results = {{
        name = data.raw["recipe"][recipeName].result,
        amount = data.raw["recipe"][recipeName].result_count or 1,
      }}
      data.raw["recipe"][recipeName].result = nil
      data.raw["recipe"][recipeName].result_count = nil
    end

    if data.raw["recipe"][recipeName].results then
      for index, result in pairs(data.raw["recipe"][recipeName].results) do
        if result.name == resultName then
          result.probability = resultProbability
          break
        end
      end
    end

    if data.raw["recipe"][recipeName].normal then
      if data.raw["recipe"][recipeName].normal.result then
        data.raw["recipe"][recipeName].normal.results = {{
          name = data.raw["recipe"][recipeName].normal.result,
          amount = data.raw["recipe"][recipeName].normal.result_count or 1,
        }}
        data.raw["recipe"][recipeName].normal.result = nil
        data.raw["recipe"][recipeName].normal.result_count = nil
      end

      if data.raw["recipe"][recipeName].normal.results then
        for index, result in pairs(data.raw["recipe"][recipeName].normal.results) do
          if result.name == resultName then
            result.probability = resultProbability
            break
          end
        end
      end
    end

    if data.raw["recipe"][recipeName].expensive then
      if data.raw["recipe"][recipeName].expensive.result then
        data.raw["recipe"][recipeName].expensive.results = {{
          name = data.raw["recipe"][recipeName].expensive.result,
          amount = data.raw["recipe"][recipeName].expensive.result_count or 1,
        }}
        data.raw["recipe"][recipeName].expensive.result = nil
        data.raw["recipe"][recipeName].expensive.result_count = nil
      end

      if data.raw["recipe"][recipeName].expensive.results then
        for index, result in pairs(data.raw["recipe"][recipeName].expensive.results) do
          if result.name == resultName then
            result.probability = resultProbability
            break
          end
        end
      end
    end

  end



  function MoreScience.lib.recipe.setMainResult(recipeName, mainResultName)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].results then
      for index, result in pairs(data.raw["recipe"][recipeName].results) do
        if result.name == mainResultName then
          data.raw["recipe"][recipeName].main_product = mainResultName
          break
        end
      end
    end

    if data.raw["recipe"][recipeName].normal and data.raw["recipe"][recipeName].normal.results then
      for index, result in pairs(data.raw["recipe"][recipeName].normal.results) do
        if result.name == mainResultName then
          data.raw["recipe"][recipeName].normal.main_product = mainResultName
          break
        end
      end
    end

    if data.raw["recipe"][recipeName].expensive and data.raw["recipe"][recipeName].expensive.results then
      for index, result in pairs(data.raw["recipe"][recipeName].expensive.results) do
        if result.name == mainResultName then
          data.raw["recipe"][recipeName].expensive.main_product = mainResultName
          break
        end
      end
    end

  end



  function MoreScience.lib.recipe.setEngergyRequired(recipeName, energyRequired)
    if not data.raw["recipe"][recipeName] then return end
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



  function MoreScience.lib.recipe.editEngergyRequired(recipeName, amountMultiplier)
    if not data.raw["recipe"][recipeName] then return end
    recipePrototypeCleanup(recipeName)

    if data.raw["recipe"][recipeName].ingredients then
      data.raw["recipe"][recipeName].energy_required = data.raw["recipe"][recipeName].energy_required * amountMultiplier
    end

    if data.raw["recipe"][recipeName].normal then
      data.raw["recipe"][recipeName].normal.energy_required = data.raw["recipe"][recipeName].normal.energy_required * amountMultiplier
    end

    if data.raw["recipe"][recipeName].expensive then
      data.raw["recipe"][recipeName].expensive.energy_required = data.raw["recipe"][recipeName].expensive.energy_required  * amountMultiplier
    end

  end



  function MoreScience.lib.recipe.setLocalisedName(recipeName, localeString)
    if not data.raw["recipe"][recipeName] then return end

    MoreScience.lib.item.setLocalisedName("recipe", recipeName, localeString)
  end



  function MoreScience.lib.recipe.setSubgroup(recipeName, subgroup)
    if not data.raw["recipe"][recipeName] then return end

    MoreScience.lib.item.setSubgroup("recipe", recipeName, subgroup)
  end



  function MoreScience.lib.recipe.setOrderstring(recipeName, orderstring)
    if not data.raw["recipe"][recipeName] then return end

    MoreScience.lib.item.setOrderstring("recipe", recipeName, orderstring)
  end

end -- end of MoreScience.lib.recipe
