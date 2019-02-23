local techName = "fluid-handling"

--------------------------------------------------------------------------------
----- Fluid handling 1                                                     -----
--------------------------------------------------------------------------------
-- remove excess barreling recipes here that are not part of
-- other fluid handling researches

for fluidName,newTechName in pairs{
  ["purified-water"] = "purification-research", -- purified water needs to move to purification research
  ["crude-oil"     ] = "oil-processing"       , -- crude oil needs to move to oil processing
  ["sulfuric-acid" ] = "sulfur-processing"    , -- sulfuric acid needs to move to sulfer processing
} do
  for _,barrelingRecipe in pairs{
    "fill-%s-barrel",
    "empty-%s-barrel",
  } do
    MoreScience.lib.technology.moveRecipeUnlock(techName, newTechName, string.format(barrelingRecipe, fluidName))
  end
end

-- set recipe subgroup and order
for _,barrelingRecipe in pairs{
  "fill-%s-barrel",
  "empty-%s-barrel",
} do
  MoreScience.lib.recipe.setSubgroup   (string.format(barrelingRecipe, "purified-water"), "ms-science-raw-material"                )
  MoreScience.lib.recipe.setOrderstring(string.format(barrelingRecipe, "purified-water"), data.raw["fluid"]["purified-water"].order)
end



--------------------------------------------------------------------------------
----- Fluid handling 2 (barreling refined oil products)                    -----
--------------------------------------------------------------------------------
for _,oilFluid in pairs{
  --"crude-oil"  ,
  "petroleum-gas",
  "light-oil"    ,
  "heavy-oil"    ,
  "lubricant"    ,
  --"sulfuric-acid",
} do
  for _,barrelingRecipe in pairs{
    "fill-%s-barrel",
    "empty-%s-barrel",
  } do
    MoreScience.lib.technology.moveRecipeUnlock(techName, techName.."-2", string.format(barrelingRecipe, oilFluid))
  end
end

-- sulfuric acid barreling gets unlocked with sulfur processing
MoreScience.lib.technology.addPrerequisite("sulfur-processing", techName.."-2")
