local recipeMultiplier = 5
local fluidPerPack = 10

local previousFluid = {
  ["science-pack-1"] = nil,
}


for _,packName in pairs{
  "science-pack-1",
  "science-pack-2",
} do
  -- STEP 1: create basic recipe -----------------------------------------------
  MoreScience.lib.recipe.create(packName .. "-fluid")
  --MoreScience.lib.recipe.disable(packName .. "-fluid")
  MoreScience.lib.recipe.setEngergyRequired(packName .. "-fluid",
    (data.raw["recipe"][packName]          .energy_required or
     data.raw["recipe"][packName].normal   .energy_required or
     data.raw["recipe"][packName].expensive.energy_required ) * recipeMultiplier)
  MoreScience.lib.recipe.setCraftingCategory(packName .. "-fluid", "ms-chemical-crafting")
  MoreScience.lib.recipe.addResult(packName .. "-fluid", packName .. "-fluid", fluidPerPack*recipeMultiplier, "fluid")



  -- STEP 2a: basic ingredients ------------------------------------------------
  MoreScience.lib.recipe.addIngredient(packName .. "-fluid", "purified-water", fluidPerPack*recipeMultiplier, "fluid")
  if previousFluid[packName] then
    MoreScience.lib.recipe.addIngredient(packName .. "-fluid", previousFluid[packName], fluidPerPack*recipeMultiplier, "fluid")
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
        name   = ingredientName,
        amount = ingredient["amount"] or ingredient[2],
      })
    end
  end



  -- STEP 2c: move the ingredients over to the fluid
  for _,ingredient in pairs(ingredients) do
    MoreScience.lib.recipe.addIngredient   (packName .. "-fluid", ingredient.name, ingredient.amount*recipeMultiplier, ingredient.type)
    MoreScience.lib.recipe.removeIngredient(packName            , ingredient.name)
  end



  -- STEP 3: add the fluid to the pack recipe instead
  MoreScience.lib.recipe.editIngredient(packName, "ms-science-fluid", packName .. "-fluid", fluidPerPack)

end
