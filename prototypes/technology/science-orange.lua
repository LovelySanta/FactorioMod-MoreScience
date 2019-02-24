local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local orangePackName = "ms-science-pack-1"
local orangeTechName = orangePackName.."-research"

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
      "basic-science-research-1",
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
        {"science-pack-1", 1},
        {"science-pack-2", 3},
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
  "automobilism",
} do
  MoreScience.lib.technology.addPrerequisite(techName, orangeTechName)
end

for techName,techLevels in pairs{
  -- Oil related stuff
  ["fluid-handling-%i"            ] = {2},
  ["oil-processing"               ] = {},
  ["advanced-oil-processing"      ] = {},
  ["plastics"                     ] = {},
  ["sulfur-processing"            ] = {},
  ["batteries"                    ] = {},
  ["explosives"                   ] = {},
  ["flammables"                   ] = {},
  ["advanced-electronics"         ] = {},
  ["coal-liquefaction"            ] = {},

  ["stack-inserter"               ] = {},
  ["inserter-capacity-bonus-%i"   ] = {1, 2, 3, 4, 5, 6, 7},
  ["mining-productivity-%i"       ] = {1, 4, 8, 12, 16},
  ["research-speed-%i"            ] = {3, 4, 5, 6},

  -- logistics
  ["automobilism"                 ] = {},
  ["automated-rail-transportation"] = {},
  ["rail-signals"                 ] = {},
  ["fluid-wagon"                  ] = {},
  ["braking-force-%i"             ] = {1, 2, 3, 4, 5, 6, 7},

  -- military
  ["military-%i"                  ] = {3, 4},
  ["personal-laser-defence"       ] = {},
  ["discharge-defence"            ] = {},
  ["explosive-rocketry"           ] = {},

  ["laser"                        ] = {},
  ["laser-turrets"                ] = {},
  ["laser-turret-damage-%i"       ] = {1, 2, 3, 4, 5, 6, 7, 8},
  ["laser-turret-speed-%i"        ] = {1, 2, 3, 4, 5, 6, 7},

  ["tanks"                        ] = {},
  ["cannon-shell-damage-%i"       ] = {1, 2, 3, 4, 5, 6},
  ["cannon-shell-speed-%i"        ] = {1, 2, 3, 4, 5},

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

MoreScience.lib.technology.removeIngredient("research-speed-3", "science-pack-3")
