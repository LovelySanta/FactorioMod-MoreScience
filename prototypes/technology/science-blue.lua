local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local blueScienceName = scienceNames.blue

--------------------------------------------------------------------------------
----- blue science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(blueScienceName, "pack"), scienceTech.icon .. "potion-blue.png", scienceTech.icon_size)

-- prerequisites this technology depend on
MoreScience.lib.technology.addPrerequisite(string.format(blueScienceName, "pack"), "flammables")
MoreScience.lib.technology.addPrerequisite(string.format(blueScienceName, "pack"), "engine")

-- ingredients
MoreScience.lib.technology.removeIngredient(string.format(blueScienceName, "pack"),    string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(blueScienceName, "pack"), 3, string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addIngredient   (string.format(blueScienceName, "pack"), 5, string.format(scienceNames.orange, "pack"))

MoreScience.lib.technology.addRecipeUnlock(string.format(blueScienceName, "pack"), string.format(blueScienceName, "fluid"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(blueScienceName, "pack"), string.format(blueScienceName, "pack"), string.format(blueScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other blue science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-4",
  "mining-productivity-2",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(blueScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["fluid-wagon"                      ] = {},
  ["roboports"                        ] = {},
  ["logistic-robotics"                ] = {},
  ["character-logistic-slots-%i"      ] = {1, 2},
  ["character-logistic-trash-slots-%i"] = {1},
} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(blueScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(blueScienceName, "pack"))

    end
  end
end


MoreScience.lib.technology.removeIngredient  ("braking-force-4"                    , string.format(scienceNames.purple, "pack"))
MoreScience.lib.technology.addPrerequisite   ("braking-force-4"                    , "fluid-wagon"                             )
MoreScience.lib.technology.removeIngredient  ("inserter-capacity-bonus-4"          , string.format(scienceNames.purple, "pack"))
MoreScience.lib.technology.addPrerequisite   ("inserter-capacity-bonus-4"          , "effectivity-module-2"                    )
MoreScience.lib.technology.addPrerequisite   ("nuclear-power"                      , "electric-energy-distribution-2"          )

MoreScience.lib.technology.addPrerequisite   ("stronger-explosives-5"              , "explosive-rocketry"                      )
MoreScience.lib.technology.removeIngredient  ("stronger-explosives-5"              , string.format(scienceNames.yellow, "pack"))
MoreScience.lib.technology.movePrerequisite  ("tanks", "explosives"                , "explosive-rocketry"                      )
MoreScience.lib.technology.addPrerequisite   ("weapon-shooting-speed-5"            , "tanks"                                   )
MoreScience.lib.technology.addPrerequisite   ("physical-projectile-damage-5"       , "tanks"                                   )

MoreScience.lib.technology.addPrerequisite   ("energy-weapons-damage-4"            , "combat-robotics-2"                       )
MoreScience.lib.technology.addPrerequisite   ("laser-turret-speed-4"               , "electric-energy-distribution-2"          )
MoreScience.lib.technology.addPrerequisite   ("follower-robot-count-3"             , "combat-robotics-2"                       )

MoreScience.lib.technology.addPrerequisite   ("worker-robots-speed-2"              , "logistic-robotics"                       )
MoreScience.lib.technology.removeIngredient  ("worker-robots-speed-3"              , string.format(scienceNames.yellow, "pack"))
MoreScience.lib.technology.addPrerequisite   ("worker-robots-speed-3"              , "low-density-structure"                   )
MoreScience.lib.technology.addPrerequisite   ("inserter-capacity-bonus-3"          , "advanced-electronics-2"                  )
MoreScience.lib.technology.removePrerequisite("auto-character-logistic-trash-slots", string.format(blueScienceName    , "pack"))

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
MoreScience.lib.technology.moveRecipeUnlock(concreteName, concrete.name, "refined-concrete"       )
MoreScience.lib.technology.moveRecipeUnlock(concreteName, concrete.name, "refined-hazard-concrete")

-- other technologies that depend on this one
MoreScience.lib.technology.movePrerequisite("uranium-processing", string.format(blueScienceName, "pack"), concrete.name)
