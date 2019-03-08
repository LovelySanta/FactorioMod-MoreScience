local scienceTech      = require("prototypes/settings").techIcons
local scienceNames     = require("prototypes/settings").scienceNames
local whiteScienceName = scienceNames.white
local rocketParts      = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- blue science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(whiteScienceName, "pack"), scienceTech.icon .. "potion-white.png", scienceTech.icon_size)

-- ingredients
MoreScience.lib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 2, string.format(scienceNames.gray  , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 3, string.format(scienceNames.cyan  , "pack"))
MoreScience.lib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.purple, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.purple, "pack"))
MoreScience.lib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.yellow, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.yellow, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 5, string.format(scienceNames.pink  , "pack"))

MoreScience.lib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(rocketParts.container, "mk1")                )
MoreScience.lib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(rocketParts.payload  , "mk1", "empty-bottle"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "pack" )  , "satellite"    ) -- this is just for unlock ordening
MoreScience.lib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "fluid")                   )
MoreScience.lib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "pack" )                   )

--------------------------------------------------------------------------------
----- other purple science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{

} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(whiteScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(whiteScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(whiteScienceName, "pack"))

    end
  end
end
