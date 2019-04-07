local scienceTech       = require("prototypes/settings").techIcons
local scienceNames      = require("prototypes/settings").scienceNames
local pinkScienceName = scienceNames.pink

--------------------------------------------------------------------------------
----- orange science research                                              -----
--------------------------------------------------------------------------------

data:extend({
  {
    type = "technology",
    name = string.format(pinkScienceName, "pack"),
    icon = scienceTech.icon .. "potion-pink.png",
    icon_size = scienceTech.icon_size,
    prerequisites = {
      "effectivity-module",
      "kovarex-enrichment-process",
      "rocket-control-unit",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = string.format(pinkScienceName, "fluid")
      },
      {
        type = "unlock-recipe",
        recipe = string.format(pinkScienceName, "pack")
      },
    },
    unit =
    {
      count = 150,
      ingredients = {
        {string.format(scienceNames.red   , "pack"), 1},
        {string.format(scienceNames.green , "pack"), 2},
        {string.format(scienceNames.gray  , "pack"), 2},
        {string.format(scienceNames.orange, "pack"), 3},
        {string.format(scienceNames.cyan  , "pack"), 3},
        {string.format(scienceNames.blue  , "pack"), 4},
        {string.format(scienceNames.purple, "pack"), 5},
        {string.format(scienceNames.yellow, "pack"), 5},
      },
      time = 60
    },
    upgrade = false,
    order = "c-a"
  },
})

--------------------------------------------------------------------------------
----- other pink science technologies                                    -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "character-logistic-slots-5"      ,
  "character-logistic-trash-slots-4",
  "worker-robots-speed-5"           ,
  "inserter-capacity-bonus-7"       ,
  "braking-force-7"                 ,
} do
  LSlib.technology.addPrerequisite(techName, string.format(pinkScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["character-logistic-slots-%i"      ] = {5, 6},
  ["character-logistic-trash-slots-%i"] = {4, 5},
  ["worker-robots-speed-%i"           ] = {5, 6},
  ["inserter-capacity-bonus-%i"       ] = {7},
  ["braking-force-%i"                 ] = {7},
  ["rocket-silo"                      ] = {},
} do
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(pinkScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(pinkScienceName, "pack"))

    end
  end
end
