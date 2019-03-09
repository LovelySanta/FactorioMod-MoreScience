local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local blueScienceName = scienceNames.blue

--------------------------------------------------------------------------------
----- blue science research                                               -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(blueScienceName, "pack"), scienceTech.icon .. "potion-blue.png", scienceTech.icon_size)

-- prerequisites this technology depend on
LSlib.technology.addPrerequisite(string.format(blueScienceName, "pack"), "flammables")
LSlib.technology.addPrerequisite(string.format(blueScienceName, "pack"), "engine")

-- ingredients
LSlib.technology.removeIngredient(string.format(blueScienceName, "pack"),    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(blueScienceName, "pack"), 3, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (string.format(blueScienceName, "pack"), 5, string.format(scienceNames.orange, "pack"))

LSlib.technology.addRecipeUnlock(string.format(blueScienceName, "pack"), string.format(blueScienceName, "fluid"))
LSlib.technology.moveRecipeUnlock(string.format(blueScienceName, "pack"), string.format(blueScienceName, "pack"), string.format(blueScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other blue science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-4",
  "mining-productivity-2",
} do
  LSlib.technology.addPrerequisite(techName, string.format(blueScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["fluid-wagon"                      ] = {},
  ["roboports"                        ] = {},
  ["logistic-robotics"                ] = {},
  ["character-logistic-slots-%i"      ] = {1, 2},
  ["character-logistic-trash-slots-%i"] = {1},
} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(blueScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(blueScienceName, "pack"))

    end
  end
end


LSlib.technology.removeIngredient  ("braking-force-4"                    , string.format(scienceNames.purple, "pack"))
LSlib.technology.addPrerequisite   ("braking-force-4"                    , "fluid-wagon"                             )
LSlib.technology.removeIngredient  ("inserter-capacity-bonus-4"          , string.format(scienceNames.purple, "pack"))
LSlib.technology.addPrerequisite   ("inserter-capacity-bonus-4"          , "effectivity-module-2"                    )
LSlib.technology.addPrerequisite   ("nuclear-power"                      , "electric-energy-distribution-2"          )

LSlib.technology.addPrerequisite   ("stronger-explosives-5"              , "explosive-rocketry"                      )
LSlib.technology.removeIngredient  ("stronger-explosives-5"              , string.format(scienceNames.yellow, "pack"))
LSlib.technology.movePrerequisite  ("tanks", "explosives"                , "explosive-rocketry"                      )
LSlib.technology.addPrerequisite   ("weapon-shooting-speed-5"            , "tanks"                                   )
LSlib.technology.addPrerequisite   ("physical-projectile-damage-5"       , "tanks"                                   )

LSlib.technology.addPrerequisite   ("energy-weapons-damage-4"            , "combat-robotics-2"                       )
LSlib.technology.addPrerequisite   ("laser-turret-speed-4"               , "electric-energy-distribution-2"          )
LSlib.technology.addPrerequisite   ("follower-robot-count-3"             , "combat-robotics-2"                       )

LSlib.technology.addPrerequisite   ("worker-robots-speed-2"              , "logistic-robotics"                       )
LSlib.technology.removeIngredient  ("worker-robots-speed-3"              , string.format(scienceNames.yellow, "pack"))
LSlib.technology.addPrerequisite   ("worker-robots-speed-3"              , "low-density-structure"                   )
LSlib.technology.addPrerequisite   ("inserter-capacity-bonus-3"          , "advanced-electronics-2"                  )
LSlib.technology.removePrerequisite("auto-character-logistic-trash-slots", string.format(blueScienceName    , "pack"))

--------------------------------------------------------------------------------
----- concrete-2 research                                                  -----
--------------------------------------------------------------------------------
local concrete = util.table.deepcopy(data.raw["technology"]["concrete"])
local concreteName = concrete.name
concrete.name = concreteName .. "-2"

concrete.prerequisites = {
  concreteName,
  "advanced-material-processing-2",
}
concrete.effects = nil
concrete.unit = util.table.deepcopy(data.raw["technology"]["advanced-material-processing-2"].unit)

concrete.order = concrete.order .. "-2"
data:extend{concrete}

-- add recipe unlocks
LSlib.technology.moveRecipeUnlock(concreteName, concrete.name, "refined-concrete"       )
LSlib.technology.moveRecipeUnlock(concreteName, concrete.name, "refined-hazard-concrete")

-- other technologies that depend on this one
LSlib.technology.movePrerequisite("uranium-processing", string.format(blueScienceName, "pack"), concrete.name)
