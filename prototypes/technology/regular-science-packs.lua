
local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128

--------------------------------------------------------------------------------
----- Basic science pack 2                                                 -----
--------------------------------------------------------------------------------
-- disable the recipe
MoreScience.lib.recipe.disable("science-pack-2")

-- remove recipe unlock from other technologies
MoreScience.lib.technology.removeRecipeUnlock("oil-processing", "chemical-plant")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-science-research-1",
    icon = scienceResearch.icon .. "potion-green.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "automation-2",
      "logistics",
      "steel-processing",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-science-fluid-1",
      },
      {
        type = "unlock-recipe",
        recipe = "basic-science-fluid-2",
      },
      {
        type = "unlock-recipe",
        recipe = "science-pack-2",
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "purified-water",
      },
    },
    unit =
    {
      count = 30,
      ingredients =
      {
        {"science-pack-1", 2},
      },
      time = 5
    },
    upgrade = false,
    order = "c-a"
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.removePrerequisite("research-speed-1", "electronics")
MoreScience.lib.technology.addPrerequisite("research-speed-1", "basic-science-research-1")
MoreScience.lib.technology.removeIngredient("research-speed-1", "science-pack-2")

MoreScience.lib.technology.addPrerequisite("toolbelt", "basic-science-research-1")

MoreScience.lib.technology.removePrerequisite("electric-energy-distribution-1", "electronics")
MoreScience.lib.technology.removePrerequisite("electric-energy-distribution-1", "steel-processing")
MoreScience.lib.technology.addPrerequisite("electric-energy-distribution-1", "basic-science-research-1")



--------------------------------------------------------------------------------
----- Basic science pack 2 - bottling                                      -----
--------------------------------------------------------------------------------
data:extend({
  {
    type = "technology",
    name = "bottling-research",
    icon = scienceResearch.icon .. "potion-empty.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "basic-science-research-1",
      "fluid-handling",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sand",
      },
      {
        type = "unlock-recipe",
        recipe = "glass",
      },
      {
        type = "unlock-recipe",
        recipe = "cork",
      },
      {
        type = "unlock-recipe",
        recipe = "empty-bottle",
      },
    },
    unit =
    {
      count = 30,
      ingredients =
      {
        {"science-pack-1", 2},
      },
      time = 5
    },
    upgrade = false,
    order = "c-a"
  },
})

-- Fix research tree for bottling-research
MoreScience.lib.technology.addPrerequisite("research-speed-2", "bottling-research")





--------------------------------------------------------------------------------
----- Basic science pack 3                                                 -----
--------------------------------------------------------------------------------

-- remove recipe unlock from other technologies
MoreScience.lib.technology.removeRecipeUnlock("advanced-electronics", "science-pack-3")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-science-research-2",
    icon = scienceResearch.icon .. "potion-blue.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "basic-science-research-1",
      "advanced-electronics",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-science-fluid-3",
      },
      {
        type = "unlock-recipe",
        recipe = "science-pack-3",
      },
    },
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 3},
        {"basic-automation-science-pack", 5},
      },
      time = 5
    },
    order = "a-d-c"
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("research-speed-4", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("battery-mk2-equipment", "advanced-electronics-2")

-- logistics network
MoreScience.lib.technology.addPrerequisite("electric-engine", "basic-science-research-2")
MoreScience.lib.technology.addIngredient("electric-engine", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("robotics", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("flying", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("construction-robotics", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("logistic-robotics", 1, "science-pack-3")

-- train network
--MoreScience.lib.technology.addPrerequisite("railway", "basic-science-research-2")
--MoreScience.lib.technology.addIngredient("railway", 1, "science-pack-3")
--MoreScience.lib.technology.addIngredient("automated-rail-transportation", 1, "science-pack-3")
--MoreScience.lib.technology.addIngredient("rail-signals", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("fluid-wagon", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("logistics-2", 1, "science-pack-3")

-- vehicles
MoreScience.lib.technology.addIngredient("automobilism", 1, "science-pack-3")

-- automation
MoreScience.lib.technology.addPrerequisite("advanced-material-processing-2", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("advanced-oil-processing", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("advanced-electronics-2", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("electric-energy-distribution-2", "basic-science-research-2")

-- automation: modules
MoreScience.lib.technology.addPrerequisite("speed-module-2", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("productivity-module-2", "basic-science-research-2")
MoreScience.lib.technology.addPrerequisite("effectivity-module-2", "basic-science-research-2")

-- power
MoreScience.lib.technology.addPrerequisite("nuclear-power", "basic-science-research-2")

-- automation bonusses
MoreScience.lib.technology.addPrerequisite("mining-productivity-4", "basic-science-research-2")



--------------------------------------------------------------------------------
----- Advanced science pack 1                                              -----
--------------------------------------------------------------------------------

-- remove recipe unlock from other technologies
MoreScience.lib.technology.removeRecipeUnlock("advanced-material-processing-2", "production-science-pack")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "advanced-science-research-1",
    icon = scienceResearch.icon .. "potion-purple.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "basic-science-research-2",
      "advanced-material-processing-2",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-science-fluid-1",
      },
      {
        type = "unlock-recipe",
        recipe = "production-science-pack",
      },
    },
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"basic-automation-science-pack", 3},
        {"science-pack-3", 4},
      },
      time = 5
    },
    order = "a-d-c"
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("research-speed-5", "advanced-science-research-1")

-- automation
MoreScience.lib.technology.addPrerequisite("automation-3", "advanced-science-research-1")
MoreScience.lib.technology.addPrerequisite("coal-liquefaction", "advanced-science-research-1")

-- automation: modules
MoreScience.lib.technology.addPrerequisite("productivity-module-3", "advanced-science-research-1")

-- logistics network
MoreScience.lib.technology.addPrerequisite("logistic-system", "advanced-science-research-1")
MoreScience.lib.technology.addPrerequisite("worker-robots-storage-2", "advanced-science-research-1")
MoreScience.lib.technology.addPrerequisite("worker-robots-speed-3", "advanced-science-research-1")
MoreScience.lib.technology.addPrerequisite("character-logistic-slots-4", "advanced-science-research-1")

-- power
MoreScience.lib.technology.addPrerequisite("nuclear-fuel-reprocessing", "advanced-science-research-1")

-- automation bonusses
MoreScience.lib.technology.addPrerequisite("mining-productivity-8", "advanced-science-research-1")

-- logistics bonusses
MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-4", "advanced-science-research-1")

-- military bonusses
MoreScience.lib.technology.addIngredient("grenade-damage-7", 1, "production-science-pack")



--------------------------------------------------------------------------------
----- Advanced science pack 1                                              -----
--------------------------------------------------------------------------------

-- remove recipe unlock from other technologies
MoreScience.lib.technology.removeRecipeUnlock("advanced-electronics-2", "high-tech-science-pack")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "advanced-science-research-2",
    icon = scienceResearch.icon .. "potion-yellow.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "basic-science-research-2",
      "advanced-electronics-2",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-science-fluid-2",
      },
      {
        type = "unlock-recipe",
        recipe = "high-tech-science-pack",
      },
    },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"basic-automation-science-pack", 3},
        {"science-pack-3", 4},
      },
      time = 5
    },
    order = "a-d-c"
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("research-speed-6", "advanced-science-research-2")

-- automation: modules
MoreScience.lib.technology.addPrerequisite("speed-module-3", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("effectivity-module-3", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("effect-transmission", "advanced-science-research-2")

-- logistics network
MoreScience.lib.technology.addPrerequisite("logistic-system", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("worker-robots-storage-3", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("worker-robots-speed-5", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("character-logistic-slots-6", "advanced-science-research-2")

-- power
MoreScience.lib.technology.addPrerequisite("kovarex-enrichment-process", "advanced-science-research-2")

-- automation bonusses
MoreScience.lib.technology.addPrerequisite("mining-productivity-12", "advanced-science-research-2")

-- logistics bonusses
MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-7", "advanced-science-research-2")
MoreScience.lib.technology.addPrerequisite("braking-force-6", "advanced-science-research-2")



--------------------------------------------------------------------------------
----- Extreme science pack                                                 -----
--------------------------------------------------------------------------------

-- edit research ingredient
MoreScience.lib.technology.addIngredient("rocket-silo", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("rocket-silo", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("rocket-silo", 1, "basic-power-science-pack")



--------------------------------------------------------------------------------
----- Infused science packs                                                -----
--------------------------------------------------------------------------------

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "infinite-science-research",
    icon = scienceResearch.icon .. "potion-white.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "rocket-silo",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "extreme-science-fluid",
      },
      {
        type = "unlock-recipe",
        recipe = "infused-extreme-science-pack",
      },
      {
        type = "unlock-recipe",
        recipe = "lab-mk2",
      },
    },
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
        {"basic-automation-science-pack", 1},
        {"basic-logistics-science-pack", 1},
        {"basic-power-science-pack", 1},
      },
      time = 120
    },
    order = data.raw["technology"]["rocket-silo"].order
  },
})

-- add prerequisites
--MoreScience.lib.technology.addPrerequisite("infinite-science-research", "fusion-reactor-equipment")
