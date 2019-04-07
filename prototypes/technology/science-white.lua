local scienceTech      = require("prototypes/settings").techIcons
local scienceNames     = require("prototypes/settings").scienceNames
local whiteScienceName = scienceNames.white
local rocketParts      = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- white science research                                               -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(whiteScienceName, "pack"), scienceTech.icon .. "potion-white.png", scienceTech.icon_size)

-- ingredients
LSlib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 2, string.format(scienceNames.gray  , "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 3, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.blue  , "pack"))
LSlib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.purple, "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.purple, "pack"))
LSlib.technology.removeIngredient(string.format(whiteScienceName, "pack"),    string.format(scienceNames.yellow, "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 4, string.format(scienceNames.yellow, "pack"))
LSlib.technology.addIngredient   (string.format(whiteScienceName, "pack"), 5, string.format(scienceNames.pink  , "pack"))

-- unlock effects
LSlib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(rocketParts.container, "mk1")                )
LSlib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(rocketParts.payload  , "mk1", "empty-bottle"))
LSlib.technology.moveRecipeUnlock(string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "pack" )  , "satellite"    ) -- this is just for unlock ordening
LSlib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "fluid")                   )
LSlib.technology.addRecipeUnlock (string.format(whiteScienceName, "pack"), string.format(whiteScienceName, "pack" )                   )

--------------------------------------------------------------------------------
----- other white science technologies                                     -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{

} do
  LSlib.technology.addPrerequisite(techName, string.format(whiteScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(whiteScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(whiteScienceName, "pack"))

    end
  end
end
