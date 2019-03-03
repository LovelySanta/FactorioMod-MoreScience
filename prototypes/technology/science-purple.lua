local scienceTech       = require("prototypes/settings").techIcons
local scienceNames      = require("prototypes/settings").scienceNames
local purpleScienceName = scienceNames.purple

--------------------------------------------------------------------------------
----- blue science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(purpleScienceName, "pack"), scienceTech.icon .. "potion-purple.png", scienceTech.icon_size)

-- ingredients
MoreScience.lib.technology.removeIngredient(string.format(purpleScienceName, "pack"),    string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 4, string.format(scienceNames.cyan  , "pack"))
MoreScience.lib.technology.removeIngredient(string.format(purpleScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(purpleScienceName, "pack"), 5, string.format(scienceNames.blue  , "pack"))

MoreScience.lib.technology.addRecipeUnlock(string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "fluid"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "pack"), string.format(purpleScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other purple science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "mining-productivity-8",
  "inserter-capacity-bonus-5",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(purpleScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(purpleScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(purpleScienceName, "pack"))

    end
  end
end

MoreScience.lib.technology.addPrerequisite ("worker-robots-storage-2"                                            , "logistics-3"         )

-- modules
MoreScience.lib.technology.movePrerequisite("effect-transmission"      , string.format(purpleScienceName, "pack"), "effectivity-module-3")
MoreScience.lib.technology.movePrerequisite("speed-module-3"           , string.format(purpleScienceName, "pack"), "effect-transmission" )
MoreScience.lib.technology.movePrerequisite("productivity-module-3"    , string.format(purpleScienceName, "pack"), "effect-transmission" )

MoreScience.lib.technology.addPrerequisite ("braking-force-5"                                                    , "logistics-3"         )
MoreScience.lib.technology.addPrerequisite ("inserter-capacity-bonus-6"                                          , "logistics-3"         )
MoreScience.lib.technology.addPrerequisite ("research-speed-5"                                                   , "automation-3"        )
