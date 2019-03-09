local scienceNames         = require("prototypes/settings").scienceNames
local fluidsPerPack        = require("prototypes/settings").fluidsPerPack
local previousFluid        = require("prototypes/settings").previousFluid
local recipeMultiplier     = require("prototypes/settings").recipeMultiplier
local ingredientMultiplier = require("prototypes/settings").ingredientMultiplier



for scienceName,_ in pairs(previousFluid) do
  local packName  = string.format(scienceName, "pack" )
  local fluidName = string.format(scienceName, "fluid")

  -- extract the recipe result amount to use this in the fluid recipe
  local recipeResultMultiplier = LSlib.recipe.getResultCount(packName, packName)
  LSlib.recipe.setResultCount(packName, packName, 1)

  -- STEP 1: create basic recipe -----------------------------------------------
  LSlib.recipe.create(fluidName)
  LSlib.recipe.disable(fluidName)
  LSlib.recipe.setEngergyRequired(fluidName,
    LSlib.recipe.getEngergyRequired(packName) * recipeMultiplier)
  LSlib.recipe.setCraftingCategory(fluidName, "ms-chemical-crafting")
  LSlib.recipe.addResult(fluidName, fluidName, fluidsPerPack * recipeMultiplier * recipeResultMultiplier, "fluid")



  -- STEP 2a: basic ingredients ------------------------------------------------
  LSlib.recipe.addIngredient(fluidName, "purified-water", fluidsPerPack * recipeMultiplier * recipeResultMultiplier, "fluid")
  if previousFluid[scienceName] then
    LSlib.recipe.addIngredient(fluidName, string.format(previousFluid[scienceName], "fluid"), fluidsPerPack * recipeMultiplier * recipeResultMultiplier, "fluid")
  end



  -- STEP 2b: extract the extra ingredients out of the pack --------------------
  ingredients = {}
  for _,ingredient in pairs(data.raw["recipe"][packName]          .ingredients or
                            data.raw["recipe"][packName].normal   .ingredients or
                            data.raw["recipe"][packName].expensive.ingredients) do
    local ingredientName = ingredient["name"  ] or ingredient[1]
    if not (ingredientName == "empty-bottle" or ingredientName == "ms-science-fluid") then
      table.insert(ingredients, {
        type   = ingredient["type"  ] or "item"       ,
        name   = ingredientName                       ,
        amount = ingredient["amount"] or ingredient[2],
      })
    end
  end



  -- STEP 2c: move the ingredients over to the fluid ---------------------------
  for _,ingredient in pairs(ingredients) do
    local amount = math.floor((ingredient.amount + 0.5) * ingredientMultiplier[scienceName])
    amount = amount > 0 and amount or 1 -- minimal require 1
    LSlib.recipe.addIngredient   (fluidName, ingredient.name, ingredient.amount*ingredientMultiplier[scienceName], ingredient.type)
    LSlib.recipe.removeIngredient(packName , ingredient.name)
  end



  -- STEP 3: add the fluid to the pack recipe instead --------------------------
  LSlib.recipe.editIngredient(packName, "ms-science-fluid", fluidName, fluidsPerPack)

  -- STEP 4: allow productivity on the science fluid ---------------------------
  LSlib.recipe.allowModuleEffect({
    "productivity-module"  ,
    "productivity-module-2",
    "productivity-module-3",
  }, fluidName)
end

-- regular red science pack require double the amount of purified water since it has no previous fluid
LSlib.recipe.editIngredient(string.format(scienceNames.red, "fluid"), "purified-water", "purified-water", 2)

-- special recipe for space science fluid
data:extend{{
  type = "recipe",
  name = string.format(scienceNames.white, "fluid"),
  energy_required = 30,
  enabled = false,
  category = "ms-chemical-crafting",
  ingredients =
  {
    {string.format(scienceNames.white, "pack"), 5}
  },
  results =
  {
    {type = "item", name = "empty-bottle", amount = 5},
    {type = "fluid", name = string.format(scienceNames.white, "fluid"), amount = 5 * fluidsPerPack},
  },
  main_product = string.format(scienceNames.white, "fluid"),
}}
