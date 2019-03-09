local scienceTech       = require("prototypes/settings").techIcons
local scienceNames      = require("prototypes/settings").scienceNames
local purpleScienceName = scienceNames.purple

--------------------------------------------------------------------------------
----- purple science research                                              -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(purpleScienceName, "pack"), scienceTech.icon .. "potion-purple.png", scienceTech.icon_size)

-- ingredients
LSlib.technology.removeIngredient(string.format(purpleScienceName, "pack"),    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 4, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(string.format(purpleScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 5, string.format(scienceNames.blue  , "pack"))

LSlib.technology.addRecipeUnlock(string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "fluid"))
LSlib.technology.moveRecipeUnlock(string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other purple science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "mining-productivity-3",
  "inserter-capacity-bonus-5",
} do
  LSlib.technology.addPrerequisite(techName, string.format(purpleScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(purpleScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(purpleScienceName, "pack"))

    end
  end
end

LSlib.technology.addPrerequisite ("worker-robots-storage-2"                                            , "logistics-3"         )

-- modules
LSlib.technology.movePrerequisite("effect-transmission"      , string.format(purpleScienceName, "pack"), "effectivity-module-3")
LSlib.technology.movePrerequisite("speed-module-3"           , string.format(purpleScienceName, "pack"), "effect-transmission" )
LSlib.technology.movePrerequisite("productivity-module-3"    , string.format(purpleScienceName, "pack"), "effect-transmission" )

LSlib.technology.addPrerequisite ("braking-force-5"                                                    , "logistics-3"         )
LSlib.technology.addPrerequisite ("inserter-capacity-bonus-6"                                          , "logistics-3"         )
LSlib.technology.addPrerequisite ("research-speed-5"                                                   , "automation-3"        )
