local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local cyanScienceName = scienceNames.cyan

--------------------------------------------------------------------------------
----- cyan science research                                                -----
--------------------------------------------------------------------------------

data:extend({
  {
    type = "technology",
    name = string.format(cyanScienceName, "pack"),
    icon = scienceTech.icon .. "potion-lightblue.png",
    icon_size = scienceTech.icon_size,
    prerequisites = {
      "solar-energy"                   ,
      "electric-energy-distribution-1",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = string.format(cyanScienceName, "fluid"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(cyanScienceName, "pack"),
      },
    },
    unit =
    {
      count = 150,
      ingredients = {
        {string.format(scienceNames.red  , "pack"), 1},
        {string.format(scienceNames.green, "pack"), 3},
      },
      time = 15
    },
    upgrade = false,
    order = "c-a"
  },
})

--------------------------------------------------------------------------------
----- other cyan science technologies                                      -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-3"              ,
  "battery"                       ,
  "electric-engine"               ,
  "braking-force-3"               ,
  "flight"                        ,
  "modular-armor"                 ,
  "advanced-material-processing-2",
  "electric-energy-distribution-2",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(cyanScienceName, "pack"))
end
MoreScience.lib.technology.movePrerequisite("mining-productivity-1", "advanced-electronics", string.format(cyanScienceName, "pack"))

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["research-speed-%i"                      ] = {3, 4, 5, 6},
  ["mining-productivity-%i"                 ] = {1, 4, 8, 12, 16},
  ["inserter-capacity-bonus-%i"             ] = {4, 5, 6, 7},

  ["electric-engine"                        ] = {},
  ["braking-force-%i"                       ] = {3, 4, 5, 6, 7},
  ["advanced-material-processing-%i"        ] = {2},

  -- power
  ["battery"                                ] = {},
  ["electric-energy-accumulators-%i"        ] = {1},
  ["electric-energy-distribution-%i"        ] = {2},

  ["laser"                                  ] = {},
  ["laser-turrets"                          ] = {},
  ["energy-weapons-damage-%i"               ] = {1, 2, 3, 4, 5, 6},
  ["laser-turret-speed-%i"                  ] = {1, 2, 3, 4, 5, 6, 7},

  -- armor
  ["modular-armor"                          ] = {},
  ["power-armor%s"                          ] = {"", "-2"},
  ["effectivity-module-%i"                  ] = {2},

  -- equpment
  ["solar-panel-equipment"                  ] = {},
  ["belt-immunity-equipment"                ] = {},
  ["night-vision-equipment"                 ] = {},
  ["battery%s-equipment"                    ] = {"", "-mk2"},
  ["personal-roboport-equipment%s"          ] = {"", "-2"},
  ["energy-shield%s-equipment"              ] = {"", "-mk2"},
  ["discharge-defense-equipment"            ] = {},
  ["personal-laser-defense-equipment"       ] = {},
  ["exoskeleton-equipment"                  ] = {},

  -- bots
  ["flight"                                 ] = {},
  ["robotics"                               ] = {},
  ["worker-robots-speed-%i"                 ] = {1, 2, 3, 4, 5, 6},
  ["worker-robots-storage-%i"               ] = {1, 2, 3},
  ["construction-robotics"                  ] = {},
  ["logistic-robotics"                      ] = {},
  ["roboports"                              ] = {},
  ["character-logistic-slots-%i"            ] = {1, 2, 3, 4, 5, 6},
  ["character-logistic-trash-slots-%i"      ] = {1, 2, 3, 4, 5},
  ["auto-character-logistic-trash-slots"    ] = {},
  ["combat-robotics%s"                      ] = {"", "-2", "-3"},
  ["follower-robot-count-%i"                ] = {1, 2, 3, 4, 5, 6, 7},

  -- uranium stuff
  ["uranium-processing"                     ] = {},
  ["nuclear-power"                          ] = {},
  ["nuclear-fuel-reprocessing"              ] = {},
  ["kovarex-enrichment-process"             ] = {},
} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(cyanScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(cyanScienceName, "pack"))

    end
  end
end

MoreScience.lib.technology.removeIngredient  ("research-speed-3"           , string.format(scienceNames.blue  , "pack") )
MoreScience.lib.technology.removeIngredient  ("braking-force-3"            , string.format(scienceNames.blue  , "pack") )
MoreScience.lib.technology.removeIngredient  ("braking-force-3"            , string.format(scienceNames.purple, "pack") )

MoreScience.lib.technology.addPrerequisite   ("effectivity-module-2"       , "electric-energy-distribution-2"           )

MoreScience.lib.technology.addPrerequisite   ("night-vision-equipment"     , "laser"                                    )
MoreScience.lib.technology.movePrerequisite  ("battery-equipment"          , "battery", "electric-energy-accumulators-1")
MoreScience.lib.technology.removeIngredient  ("personal-roboport-equipment", string.format(scienceNames.blue  , "pack") )
MoreScience.lib.technology.removePrerequisite("personal-roboport-equipment", string.format(scienceNames.blue  , "pack") )
