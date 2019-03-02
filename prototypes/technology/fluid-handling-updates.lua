local techName = "fluid-handling"
local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Fluid handling 1                                                     -----
--------------------------------------------------------------------------------
-- remove excess barreling recipes here that are not part of
-- other fluid handling researches

for fluidName,newTechName in pairs{
  ["purified-water"] = "purification-research", -- purified water needs to move to purification research
  ["crude-oil"     ] = "oil-processing"       , -- crude oil needs to move to oil processing
  ["sulfuric-acid" ] = "sulfur-processing"    , -- sulfuric acid needs to move to sulfer processing
  ["lubricant"     ] = "lubricant"
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
  --"lubricant"    ,
  --"sulfuric-acid",
} do
  for _,barrelingRecipe in pairs{
    "fill-%s-barrel",
    "empty-%s-barrel",
  } do
    MoreScience.lib.technology.moveRecipeUnlock(techName, techName.."-2", string.format(barrelingRecipe, oilFluid))
  end
end

--------------------------------------------------------------------------------
----- Fluid handling 3 (barreling science fluids)                          -----
--------------------------------------------------------------------------------
for _,scienceFluid in pairs{
  string.format(scienceNames.red   , "fluid"),
  string.format(scienceNames.green , "fluid"),
  string.format(scienceNames.gray  , "fluid"),
  string.format(scienceNames.orange, "fluid"),
  string.format(scienceNames.cyan  , "fluid"),
  string.format(scienceNames.blue  , "fluid"),
  --string.format(scienceNames.pink  , "fluid"),
  --string.format(scienceNames.purple, "fluid"),
  --string.format(scienceNames.yellow, "fluid"),
  --string.format(scienceNames.white , "fluid"),
} do
  for _,barrelingRecipe in pairs{
    "fill-%s-barrel",
    "empty-%s-barrel",
  } do
    MoreScience.lib.technology.moveRecipeUnlock(techName, techName.."-3", string.format(barrelingRecipe, scienceFluid))
  end
end
