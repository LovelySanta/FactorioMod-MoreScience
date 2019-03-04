local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local yellowScienceName = scienceNames.yellow

--------------------------------------------------------------------------------
----- yellow science research                                              -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(yellowScienceName, "pack"), scienceTech.icon .. "potion-yellow.png", scienceTech.icon_size)

-- ingredients
MoreScience.lib.technology.removeIngredient(string.format(yellowScienceName, "pack"),    string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
MoreScience.lib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 4, string.format(scienceNames.cyan  , "pack"))
MoreScience.lib.technology.removeIngredient(string.format(yellowScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 5, string.format(scienceNames.blue  , "pack"))

MoreScience.lib.technology.addRecipeUnlock(string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "fluid"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other yellow science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "mining-productivity-3",
  "research-speed-6",
  "braking-force-6",
  "worker-robots-storage-3",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(yellowScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(yellowScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(yellowScienceName, "pack"))

    end
  end
end

MoreScience.lib.technology.addPrerequisite   ("energy-weapons-damage-5"         , "combat-robotics-3"                     )
MoreScience.lib.technology.addPrerequisite   ("physical-projectile-damage-6"    , "uranium-ammo"                          )
MoreScience.lib.technology.addPrerequisite   ("weapon-shooting-speed-6"         , "uranium-ammo"                          )

MoreScience.lib.technology.addPrerequisite   ("worker-robots-speed-4"           , "personal-roboport-equipment-2"         )
MoreScience.lib.technology.addPrerequisite   ("personal-roboport-equipment-2"   , "logistic-system"                       )
MoreScience.lib.technology.addPrerequisite   ("personal-roboport-equipment-2"   , "power-armor-2"                         )
MoreScience.lib.technology.removePrerequisite("fusion-reactor-equipment"        , string.format(yellowScienceName, "pack"))
MoreScience.lib.technology.movePrerequisite  ("fusion-reactor-equipment"        , "power-armor", "power-armor-2"          )

MoreScience.lib.technology.addPrerequisite   ("character-logistic-slots-4"      , "personal-roboport-equipment-2"         )
MoreScience.lib.technology.addPrerequisite   ("character-logistic-trash-slots-3", "personal-roboport-equipment-2"         )

MoreScience.lib.technology.addPrerequisite   ("rocket-control-unit"             , "rocketry"                              )
MoreScience.lib.technology.movePrerequisite  ("atomic-bomb"                     , "rocketry", "explosive-rocketry"        )
