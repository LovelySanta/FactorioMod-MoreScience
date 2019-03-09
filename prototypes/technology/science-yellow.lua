local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local yellowScienceName = scienceNames.yellow

--------------------------------------------------------------------------------
----- yellow science research                                              -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(yellowScienceName, "pack"), scienceTech.icon .. "potion-yellow.png", scienceTech.icon_size)

-- ingredients
LSlib.technology.removeIngredient(string.format(yellowScienceName, "pack"),    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 2, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 4, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(string.format(yellowScienceName, "pack"),    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (string.format(yellowScienceName, "pack"), 5, string.format(scienceNames.blue  , "pack"))

LSlib.technology.addRecipeUnlock(string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "fluid"))
LSlib.technology.moveRecipeUnlock(string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "pack"), string.format(yellowScienceName, "pack")) -- this is just for unlock ordening

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
  LSlib.technology.addPrerequisite(techName, string.format(yellowScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{

} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(yellowScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(yellowScienceName, "pack"))

    end
  end
end

LSlib.technology.addPrerequisite   ("energy-weapons-damage-5"         , "combat-robotics-3"                     )
LSlib.technology.addPrerequisite   ("physical-projectile-damage-6"    , "uranium-ammo"                          )
LSlib.technology.addPrerequisite   ("weapon-shooting-speed-6"         , "uranium-ammo"                          )

LSlib.technology.addPrerequisite   ("worker-robots-speed-4"           , "personal-roboport-equipment-2"         )
LSlib.technology.addPrerequisite   ("personal-roboport-equipment-2"   , "logistic-system"                       )
LSlib.technology.addPrerequisite   ("personal-roboport-equipment-2"   , "power-armor-2"                         )
LSlib.technology.removePrerequisite("fusion-reactor-equipment"        , string.format(yellowScienceName, "pack"))
LSlib.technology.movePrerequisite  ("fusion-reactor-equipment"        , "power-armor", "power-armor-2"          )

LSlib.technology.addPrerequisite   ("character-logistic-slots-4"      , "personal-roboport-equipment-2"         )
LSlib.technology.addPrerequisite   ("character-logistic-trash-slots-3", "personal-roboport-equipment-2"         )

LSlib.technology.addPrerequisite   ("rocket-control-unit"             , "rocketry"                              )
LSlib.technology.movePrerequisite  ("atomic-bomb"                     , "rocketry", "explosive-rocketry"        )
