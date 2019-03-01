local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local cyanPackName = "electric-power-science-pack"
local cyanTechName = cyanPackName

--------------------------------------------------------------------------------
----- cyan science research                                                -----
--------------------------------------------------------------------------------

data:extend({
  {
    type = "technology",
    name = cyanTechName,
    icon = scienceResearch.icon .. "potion-lightblue.png",
    icon_size = scienceResearch.icon_size,
    prerequisites = {
      "solar-energy"                   ,
      "electric-energy-distribution-1",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = cyanPackName.."-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = cyanPackName
      },
    },
    unit =
    {
      count = 150,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack"  , 3},
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
  "research-speed-3",
  "battery"         ,
  "electric-engine" ,
  "braking-force-2" ,
  "flight"          ,
  "modular-armor"   ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, cyanTechName)
end
MoreScience.lib.technology.movePrerequisite("mining-productivity-1", "advanced-electronics", cyanTechName)

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["research-speed-%i"             ] = {3, 4, 5, 6},
  ["mining-productivity-%i"        ] = {1, 4, 8, 12, 16},

  ["electric-engine"               ] = {},
  ["braking-force-%i"              ] = {2, 3, 4, 5, 6, 7},

  -- solar power
  ["battery"                       ] = {},
  ["electric-energy-accumulators-1"] = {},

  ["laser"                         ] = {},
  ["laser-turrets"                 ] = {},
  ["energy-weapons-damage-%i"      ] = {1, 2, 3, 4, 5, 6},
  ["laser-turret-speed-%i"         ] = {1, 2, 3, 4, 5, 6, 7},

  -- armor
  ["modular-armor"                 ] = {},
  ["power-armor"                   ] = {},
  ["power-armor-%i"                ] = {1},

  -- equpment
  ["solar-panel-equipment"         ] = {},
  ["belt-immunity-equipment"       ] = {},
  ["night-vision-equipment"        ] = {},
  ["battery%s-equipment"           ] = {"", "-MK2"},
  ["personal-roboport-equipment%s" ] = {"", "-2"},
  ["energy-shield%s-equipment"     ] = {"", "-mk2"},

  -- bots
  ["flight"                        ] = {},
  ["robotics"                      ] = {},
  ["worker-robots-speed-%i"        ] = {1, 2, 3, 4, 5, 6},
  ["construction-robotics"         ] = {},
  ["logistic-robotics"             ] = {},
  ["combat-robotics%s"             ] = {"", "-2", "-3"},
  ["follower-robot-count-%i"       ] = {1, 2, 3, 4, 5, 6, 7},

} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, cyanPackName)
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, cyanPackName)

    end
  end
end

MoreScience.lib.technology.removeIngredient  ("research-speed-3"           , "chemical-science-pack"                                  )
MoreScience.lib.technology.removeIngredient  ("braking-force-2"            , "chemical-science-pack"                                  )

MoreScience.lib.technology.addPrerequisite   ("night-vision-equipment"     , "laser"                                                  )
MoreScience.lib.technology.movePrerequisite  ("battery-equipment"          , "battery"              , "electric-energy-accumulators-1")
MoreScience.lib.technology.removeIngredient  ("personal-roboport-equipment", "chemical-science-pack"                                  )
MoreScience.lib.technology.removePrerequisite("personal-roboport-equipment", "chemical-science-pack"                                  )
