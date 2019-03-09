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
  LSlib.technology.addPrerequisite(techName, string.format(cyanScienceName, "pack"))
end
LSlib.technology.movePrerequisite("mining-productivity-1", "advanced-electronics", string.format(cyanScienceName, "pack"))

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["research-speed-%i"                      ] = {3, 4, 5, 6},

  ["automation-%i"                          ] = {3},
  ["inserter-capacity-bonus-%i"             ] = {4, 5, 6, 7},
  ["coal-liquefaction"                      ] = {},
  ["mining-productivity-%i"                 ] = {1, 2, 3, 4},

  ["electric-engine"                        ] = {},
  ["fluid-wagon"                            ] = {},
  ["braking-force-%i"                       ] = {3, 4, 5, 6, 7},
  ["advanced-material-processing-%i"        ] = {2},

  -- modules
  ["effect-transmission"                    ] = {},
  ["speed-module%s"                         ] = {"-3"},
  ["productivity-module%s"                  ] = {"-3"},
  ["effectivity-module%s"                   ] = {"-3"},

  -- power
  ["battery"                                ] = {},
  ["electric-energy-accumulators-%i"        ] = {1},
  ["electric-energy-distribution-%i"        ] = {2},
  ["rocket-control-unit"                    ] = {},

  ["laser"                                  ] = {},
  ["laser-turrets"                          ] = {},
  ["energy-weapons-damage-%i"               ] = {1, 2, 3, 4, 5, 6, 7},
  ["laser-turret-speed-%i"                  ] = {1, 2, 3, 4, 5, 6, 7},

  -- armor
  ["modular-armor"                          ] = {},
  ["power-armor%s"                          ] = {"", "-2"},
  ["effectivity-module-%i"                  ] = {2},

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

  -- bots
  ["flight"                                 ] = {},
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
  ["follower-robot-count-%i"                ] = {1, 2, 3, 4, 5, 6, 7},

  -- uranium stuff
  ["uranium-processing"                     ] = {},
  ["nuclear-power"                          ] = {},
  ["nuclear-fuel-reprocessing"              ] = {},
  ["kovarex-enrichment-process"             ] = {},

  ["rocket-silo"                            ] = {},
} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(cyanScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(cyanScienceName, "pack"))

    end
  end
end

LSlib.technology.removeIngredient  ("research-speed-3"           , string.format(scienceNames.blue  , "pack") )
LSlib.technology.removeIngredient  ("braking-force-3"            , string.format(scienceNames.blue  , "pack") )
LSlib.technology.removeIngredient  ("braking-force-3"            , string.format(scienceNames.purple, "pack") )

LSlib.technology.addPrerequisite   ("effectivity-module-2"       , "electric-energy-distribution-2"           )

LSlib.technology.addPrerequisite   ("night-vision-equipment"     , "laser"                                    )
LSlib.technology.movePrerequisite  ("battery-equipment"          , "battery", "electric-energy-accumulators-1")
LSlib.technology.removeIngredient  ("personal-roboport-equipment", string.format(scienceNames.blue  , "pack") )
LSlib.technology.removePrerequisite("personal-roboport-equipment", string.format(scienceNames.blue  , "pack") )
