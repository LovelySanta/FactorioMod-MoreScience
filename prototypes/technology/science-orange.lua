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
} do
  MoreScience.lib.technology.addPrerequisite(techName, orangeTechName)
end

for _,techName in pairs{
  "fluid-handling-2",
  "oil-processing",
  "advanced-oil-processing",
  "plastics",
  "sulfur-processing",
  "batteries",
  "explosives",
  "flammables",
  "advanced-electronics",
  "coal-liquefaction",

  "stack-inserter",
  "inserter-capacity-bonus-1",
  "inserter-capacity-bonus-2",
  "inserter-capacity-bonus-3",
  "inserter-capacity-bonus-4",
  "inserter-capacity-bonus-5",
  "inserter-capacity-bonus-6",
  "inserter-capacity-bonus-7",

  "mining-productivity-1",
  "mining-productivity-4",
  "mining-productivity-8",
  "mining-productivity-12",
  "mining-productivity-16",

  "research-speed-3",
  "research-speed-4",
  "research-speed-5",
  "research-speed-6",

  "automated-rail-transportation",
  "rail-signals",
  "fluid-wagon",
  "braking-force-1",
  "braking-force-2",
  "braking-force-3",
  "braking-force-4",
  "braking-force-5",
  "braking-force-6",
  "braking-force-7",
} do
  MoreScience.lib.technology.addIngredient(techName, 1, orangePackName)
end

MoreScience.lib.technology.removeIngredient("research-speed-3", "science-pack-3")
