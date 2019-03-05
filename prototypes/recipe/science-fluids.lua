local scienceNames         = require("prototypes/settings").scienceNames
local fluidsPerPack        = require("prototypes/settings").fluidsPerPack
local previousFluid        = require("prototypes/settings").previousFluid
local recipeMultiplier     = require("prototypes/settings").recipeMultiplier
local ingredientMultiplier = require("prototypes/settings").ingredientMultiplier



for scienceName,_ in pairs(previousFluid) do
  local packName  = string.format(scienceName, "pack" )
  local fluidName = string.format(scienceName, "fluid")

  -- STEP 1: create basic recipe -----------------------------------------------
  MoreScience.lib.recipe.create(fluidName)
  MoreScience.lib.recipe.disable(fluidName)
  MoreScience.lib.recipe.setEngergyRequired(fluidName,
    MoreScience.lib.recipe.getEngergyRequired(packName) * recipeMultiplier)
  MoreScience.lib.recipe.setCraftingCategory(fluidName, "ms-chemical-crafting")
  MoreScience.lib.recipe.addResult(fluidName, fluidName, fluidsPerPack*recipeMultiplier, "fluid")



  -- STEP 2a: basic ingredients ------------------------------------------------
  MoreScience.lib.recipe.addIngredient(fluidName, "purified-water", fluidsPerPack * recipeMultiplier, "fluid")
  if previousFluid[scienceName] then
    MoreScience.lib.recipe.addIngredient(fluidName, string.format(previousFluid[scienceName], "fluid"), fluidsPerPack * recipeMultiplier, "fluid")
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



  -- STEP 2c: move the ingredients over to the fluid
  for _,ingredient in pairs(ingredients) do
    local amount = math.floor((ingredient.amount + 0.5) * ingredientMultiplier[scienceName])
    amount = amount > 0 and amount or 1 -- minimal require 1
    MoreScience.lib.recipe.addIngredient   (fluidName, ingredient.name, ingredient.amount*ingredientMultiplier[scienceName], ingredient.type)
    MoreScience.lib.recipe.removeIngredient(packName , ingredient.name)
  end



  -- STEP 3: add the fluid to the pack recipe instead
  MoreScience.lib.recipe.editIngredient(packName, "ms-science-fluid", fluidName, fluidsPerPack)

end


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


for scienceColor,scienceName in pairs(scienceNames) do
  local regularPack = data.raw["recipe"][string.format(scienceName, "pack")]

  data:extend{{
    type = "recipe",
    name = "infused-"..string.format(scienceName, "pack"),
    energy_required = 2 * (regularPack and regularPack.energy_required or 50),
    enabled = true,
    category = "ms-chemical-crafting",
    ingredients =
    {
      {string.format(scienceName, "pack"), 2},
      {type = "fluid", name = string.format(scienceNames.white, "fluid"), amount = fluidsPerPack},
      {type = "fluid", name = "purified-water"                          , amount = fluidsPerPack},
    },
    result = "infused-"..string.format(scienceName, "pack"),
  }}
end
