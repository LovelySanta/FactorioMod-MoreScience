local scienceTech       = require("prototypes/settings").techIcons
local scienceNames      = require("prototypes/settings").scienceNames
local orangeScienceName = scienceNames.orange

--------------------------------------------------------------------------------
----- orange science research                                               -----
--------------------------------------------------------------------------------

data:extend({
  {
    type = "technology",
    name = string.format(orangeScienceName, "pack"),
    icon = scienceTech.icon .. "potion-orange.png",
    icon_size = scienceTech.icon_size,
    prerequisites = {
      "logistic-science-pack",
      "concrete",
      "fast-inserter",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = string.format(orangeScienceName, "fluid")
      },
      {
        type = "unlock-recipe",
        recipe = string.format(orangeScienceName, "pack")
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
        {string.format(scienceNames.red  , "pack"), 1},
        {string.format(scienceNames.green, "pack"), 3},
      },
      time = 10
    },
    upgrade = false,
    order = "c-a"
  },
})

--------------------------------------------------------------------------------
----- other orange science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "oil-processing",
  "automated-rail-transportation",
  --"automobilism",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(orangeScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["research-speed-%i"                      ] = {4, 5, 6},
  ["mining-productivity-%i"                 ] = {4, 8, 12, 16},

  -- Oil related stuff
  ["fluid-handling-%i"                      ] = {2, 3},
  ["oil-processing"                         ] = {},
  ["advanced-oil-processing"                ] = {},
  ["plastics"                               ] = {},
  ["low-density-structure"                  ] = {},
  ["sulfur"                                 ] = {},
  ["sulfur-processing"                      ] = {},
  ["battery"                                ] = {},
  ["lubricant"                              ] = {},
  ["electric-engine"                        ] = {},
  ["explosives"                             ] = {},
  ["flammables"                             ] = {},
  ["rocket-fuel"                            ] = {},
  ["advanced-electronics%s"                 ] = {"", "-2"},
  ["coal-liquefaction"                      ] = {},

  ["logistics-%i"                           ] = {3},
  ["automation-%i"                          ] = {3},
  ["stack-inserter"                         ] = {},
  ["inserter-capacity-bonus-%i"             ] = {2, 3, 4, 5, 6, 7},
  --["mining-productivity-%i"                 ] = {1, 4, 8, 12, 16},

  ["electric-energy-accumulators-%i"        ] = {1},
  ["electric-energy-distribution-%i"        ] = {2},
  ["advanced-material-processing-%i"        ] = {2},

  -- logistics
  --["automobilism"                           ] = {},
  ["automated-rail-transportation"          ] = {},
  ["rail-signals"                           ] = {},
  ["fluid-wagon"                            ] = {},
  ["braking-force-%i"                       ] = {1, 2, 3, 4, 5, 6, 7},

  -- modules
  ["modules"                                ] = {},
  ["effect-transmission"                    ] = {},
  ["speed-module%s"                         ] = {"", "-2", "-3"},
  ["productivity-module%s"                  ] = {"", "-2", "-3"},
  ["effectivity-module%s"                   ] = {"", "-2", "-3"},

  -- military
  ["military-%i"                            ] = {3, 4},
  ["cliff-explosives"                       ] = {},
  ["land-mine"                              ] = {},
  ["weapon-shooting-speed-%i"               ] = {3, 4, 5, 6},
  ["physical-projectile-damage-%i"          ] = {4, 5, 6, 7},
  ["stronger-explosives-%i"                 ] = {3, 4, 5, 6, 7},
  ["tanks"                                  ] = {},

  ["laser"                                  ] = {},
  ["laser-turrets"                          ] = {},
  ["laser-turret-speed-%i"                  ] = {1, 2, 3, 4, 5, 6, 7},
  ["energy-weapons-damage-%i"               ] = {1, 2, 3, 4, 5, 6, 7},

  ["flamethrower"                           ] = {},
  ["refined-flammables-%i"                  ] = {1, 2, 3, 4, 5, 6, 7},
  ["rocketry"                               ] = {},
  ["explosive-rocketry"                     ] = {},
  ["rocket-control-unit"                    ] = {},

  -- bots
  ["robotics"                               ] = {},
  ["worker-robots-speed-%i"                 ] = {1, 2, 3, 4, 5, 6},
  ["worker-robots-storage-%i"               ] = {1, 2, 3},
  ["construction-robotics"                  ] = {},
  ["roboports"                              ] = {},
  ["logistic-robotics"                      ] = {},
  ["logistic-system"                        ] = {},
  ["character-logistic-slots-%i"            ] = {1, 2, 3, 4, 5, 6},
  ["character-logistic-trash-slots-%i"      ] = {1, 2, 3, 4, 5},
  ["auto-character-logistic-trash-slots"    ] = {},
  ["combat-robotics%s"                      ] = {"", "-2", "-3"},
  ["combat-robotics%s"                      ] = {"", "-2", "-3"},
  ["follower-robot-count-%i"                ] = {1, 2, 3, 4, 5, 6, 7},

  -- armor
  ["modular-armor"                          ] = {},
  ["power-armor%s"                          ] = {"", "-2"},

  -- equipment
  ["solar-panel-equipment"                  ] = {},
  ["belt-immunity-equipment"                ] = {},
  ["night-vision-equipment"                 ] = {},
  ["battery%s-equipment"                    ] = {"", "-mk2"},
  ["personal-roboport-equipment%s"          ] = {"", "-2"},
  ["energy-shield%s-equipment"              ] = {"", "-mk2"},
  ["discharge-defense-equipment"            ] = {},
  ["personal-laser-defense-equipment"       ] = {},
  ["exoskeleton-equipment"                  ] = {},

  -- uranium stuff
  ["uranium-processing"                     ] = {},
  ["nuclear-power"                          ] = {},
  ["nuclear-fuel-reprocessing"              ] = {},
  ["kovarex-enrichment-process"             ] = {},
  ["uranium-ammo"                           ] = {},
  ["atomic-bomb"                            ] = {},

  ["rocket-silo"                            ] = {},

} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(orangeScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(orangeScienceName, "pack"))

    end
  end
end

MoreScience.lib.technology.removeIngredient("braking-force-1", string.format(scienceNames.blue, "pack")                                 )
MoreScience.lib.technology.movePrerequisite("braking-force-1", string.format(scienceNames.blue, "pack"), "automated-rail-transportation")
MoreScience.lib.technology.addPrerequisite ("braking-force-2", "lubricant"                                                              )
MoreScience.lib.technology.removeIngredient("braking-force-2", string.format(scienceNames.blue, "pack")                                 )

MoreScience.lib.technology.addPrerequisite ("stronger-explosives-3", "explosives"                              )
MoreScience.lib.technology.removeIngredient("stronger-explosives-3", string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addPrerequisite ("stronger-explosives-4", "rocketry"                                )
MoreScience.lib.technology.removeIngredient("stronger-explosives-4", string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.removeIngredient("stronger-explosives-4", string.format(scienceNames.yellow, "pack"))

MoreScience.lib.technology.addPrerequisite ("refined-flammables-2", "explosives")

MoreScience.lib.technology.addPrerequisite("weapon-shooting-speed-3", "rocketry")
MoreScience.lib.technology.addPrerequisite("physical-projectile-damage-4", "explosives")

for _,recipeName in pairs{
  "solid-fuel-from-petroleum-gas",
  "solid-fuel-from-light-oil"    ,
  "solid-fuel-from-heavy-oil"    ,
} do
  MoreScience.lib.technology.moveRecipeUnlock("oil-processing", "flammables", recipeName)
end

MoreScience.lib.technology.movePrerequisite("inserter-capacity-bonus-1", "stack-inserter", "fast-inserter")
MoreScience.lib.technology.addPrerequisite ("inserter-capacity-bonus-1", "logistics-2")
MoreScience.lib.technology.addPrerequisite ("inserter-capacity-bonus-2", "stack-inserter")
