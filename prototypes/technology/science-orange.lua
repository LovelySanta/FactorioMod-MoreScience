local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local orangePackName = "advanced-automation-science-pack"
local orangeTechName = orangePackName

--------------------------------------------------------------------------------
----- orange science research                                               -----
--------------------------------------------------------------------------------

data:extend({
  {
    type = "technology",
    name = orangeTechName,
    icon = scienceResearch.icon .. "potion-orange.png",
    icon_size = scienceResearch.icon_size,
    prerequisites = {
      "logistic-science-pack",
      "concrete",
      "optics",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = orangePackName.."-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = orangePackName
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack"  , 3},
      },
      time = 10
    },
    upgrade = false,
    order = "c-a"
  },
})

--------------------------------------------------------------------------------
----- other orange science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-3",
  "oil-processing",
  "automated-rail-transportation",
  --"automobilism",
} do
  MoreScience.lib.technology.addPrerequisite(techName, orangeTechName)
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  -- science related
  ["research-speed-%i"            ] = {3, 4, 5, 6},

  -- Oil related stuff
  ["fluid-handling-%i"            ] = {2},
  ["oil-processing"               ] = {},
  ["advanced-oil-processing"      ] = {},
  ["plastics"                     ] = {},
  ["sulfur"                       ] = {},
  ["sulfur-processing"            ] = {},
  ["battery"                      ] = {},
  ["lubricant"                    ] = {},
  ["explosives"                   ] = {},
  ["flammables"                   ] = {},
  ["rocket-fuel"                  ] = {},
  ["advanced-electronics"         ] = {},
  ["coal-liquefaction"            ] = {},

  ["stack-inserter"               ] = {},
  ["inserter-capacity-bonus-%i"   ] = {2, 3, 4, 5, 6, 7},
  ["mining-productivity-%i"       ] = {1, 4, 8, 12, 16},

  -- logistics
  --["automobilism"                 ] = {},
  ["automated-rail-transportation"] = {},
  ["rail-signals"                 ] = {},
  ["fluid-wagon"                  ] = {},
  ["braking-force-%i"             ] = {1, 2, 3, 4, 5, 6, 7},

  -- modules
  ["modules"                      ] = {},
  ["speed-module"                ] = {},
  ["speed-module-%i"             ] = {2, 3},
  ["productivity-module"         ] = {},
  ["productivity-module-%i"      ] = {2, 3},
  ["effectivity-module"          ] = {},
  ["effectivity-module-%i"       ] = {2, 3},

  -- power
  --["solar-energy"                 ] = {},
  ["portable-solar-panel"         ] = {},

  -- military
  ["military-%i"                  ] = {3, 4},
  ["cliff-explosives"             ] = {},
  ["land-mine"                    ] = {},
  ["weapon-shooting-speed-%i"     ] = {3, 4, 5, 6},
  ["physical-projectile-damage-%i"] = {4, 5, 6, 7},
  ["stronger-explosives-%i"       ] = {3, 4, 5, 6, 7},

  ["laser"                        ] = {},
  ["laser-turrets"                ] = {},
  ["laser-turret-speed-%i"        ] = {1, 2, 3, 4, 5, 6, 7},
  ["energy-weapons-damage-%i"     ] = {1, 2, 3, 4, 5, 6, 7},

  ["flamethrower"                 ] = {},
  ["refined-flammables-%i"        ] = {1, 2, 3, 4, 5, 6, 7},
  ["rocketry"                     ] = {},
  ["explosive-rocketry"           ] = {},

  --["tanks"                        ] = {},
  --["cannon-shell-damage-%i"       ] = {1, 2, 3, 4, 5, 6},
  --["cannon-shell-speed-%i"        ] = {1, 2, 3, 4, 5},

  ["combat-robotics"              ] = {},
  ["combat-robotics-%i"           ] = {2, 3},
} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, orangePackName)
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, orangePackName)

    end
  end
end

MoreScience.lib.technology.removeIngredient("research-speed-3", "chemical-science-pack")

MoreScience.lib.technology.removeIngredient("braking-force-1", "chemical-science-pack"                                 )
MoreScience.lib.technology.movePrerequisite("braking-force-1", "chemical-science-pack", "automated-rail-transportation")
MoreScience.lib.technology.addPrerequisite ("braking-force-2", "chemical-science-pack"                                 )

MoreScience.lib.technology.addPrerequisite ("stronger-explosives-3", "explosives"           )
MoreScience.lib.technology.removeIngredient("stronger-explosives-3", "chemical-science-pack")
MoreScience.lib.technology.addPrerequisite ("stronger-explosives-4", "rocketry"             )
MoreScience.lib.technology.removeIngredient("stronger-explosives-4", "chemical-science-pack")
MoreScience.lib.technology.removeIngredient("stronger-explosives-4", "utility-science-pack" )
MoreScience.lib.technology.removeIngredient("stronger-explosives-5", "utility-science-pack")

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
