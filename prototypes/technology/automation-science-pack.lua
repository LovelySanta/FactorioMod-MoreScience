
--------------------------------------------------------------------------------
----- Basic automation                                                     -----
--------------------------------------------------------------------------------

-- disable the recipes
MoreScience.lib.recipe.disable("inserter")
MoreScience.lib.recipe.disable("transport-belt")
MoreScience.lib.recipe.disable("electric-mining-drill")
MoreScience.lib.recipe.disable("lab")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-automation",
    icon = "__base__/graphics/technology/automation.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill"
      },
      {
        type = "unlock-recipe",
        recipe = "lab"
      },
    },
    prerequisites = nil,
    unit =
    {
      count = 5,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 5
    },
    order = "a-b-a",
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("automation", "basic-automation")
MoreScience.lib.technology.addPrerequisite("logistics", "basic-automation")
--MoreScience.lib.technology.addPrerequisite("stack-inserter", "basic-automation")



--------------------------------------------------------------------------------
----- Basic automation science pack                                        -----
--------------------------------------------------------------------------------
-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-automation-science-research",
    icon = "__MoreScience__/graphics/technology/potions/potion-orange.png",
    icon_size = 128,
    prerequisites = {
      "basic-science-research-1",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-automation-science-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-automation-science-pack"
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

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("research-speed-3", "basic-automation-science-research")
MoreScience.lib.technology.removeIngredient("research-speed-3", "science-pack-3")
MoreScience.lib.technology.addIngredient("research-speed-3", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("research-speed-4", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("research-speed-5", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("research-speed-6", 1, "basic-automation-science-pack")

MoreScience.lib.technology.addPrerequisite("automation-3", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("automation-3", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addPrerequisite("advanced-material-processing", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("advanced-material-processing", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("advanced-material-processing-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("laser", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addPrerequisite("logistics-2", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("logistics-2", 1, "basic-automation-science-pack")


-- nuclear
MoreScience.lib.technology.addIngredient("nuclear-power", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("nuclear-fuel-reprocessing", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("kovarex-enrichment-process", 1, "basic-automation-science-pack")


MoreScience.lib.technology.addPrerequisite("circuit-network", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("circuit-network", 1, "basic-automation-science-pack")

-- oil processing
MoreScience.lib.technology.addPrerequisite("oil-processing", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("oil-processing", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("advanced-oil-processing", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("coal-liquefaction", 1, "basic-automation-science-pack")

MoreScience.lib.technology.addIngredient("plastics", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("advanced-electronics", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("advanced-electronics-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("sulfur-processing", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("battery", 1, "basic-automation-science-pack")

-- vehicles
MoreScience.lib.technology.addIngredient("automobilism", 1, "basic-automation-science-pack")

-- train network
MoreScience.lib.technology.addIngredient("railway", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("automated-rail-transportation", 2, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("rail-signals", 3, "basic-automation-science-pack")

-- modules
MoreScience.lib.technology.addIngredient("modules", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("speed-module", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("speed-module-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("speed-module-3", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("productivity-module", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("productivity-module-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("productivity-module-3", 1, "basic-automation-science-pack")

-- armor equipment
MoreScience.lib.technology.addIngredient("modular-armor", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("night-vision-equipment", 1, "basic-automation-science-pack")

-- robot network
MoreScience.lib.technology.addPrerequisite("engine", "basic-automation-science-research")
MoreScience.lib.technology.addIngredient("engine", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("electric-engine", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("robotics", 1, "basic-automation-science-pack")
--MoreScience.lib.technology.addIngredient("flying", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("logistic-system", 1, "basic-automation-science-pack")

MoreScience.lib.technology.addIngredient("character-logistic-slots-1", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-3", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-4", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-5", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-6", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-trash-slots-1", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-trash-slots-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("auto-character-logistic-trash-slots", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment-2", 1, "basic-automation-science-pack")

-- inserter bonus
MoreScience.lib.technology.addIngredient("stack-inserter", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-1", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-2", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-3", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-4", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-5", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-6", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-7", 1, "basic-automation-science-pack")

-- mining productivity
MoreScience.lib.technology.addIngredient("mining-productivity-1", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("mining-productivity-4", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("mining-productivity-8", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("mining-productivity-12", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("mining-productivity-16", 1, "basic-automation-science-pack")

-- military
MoreScience.lib.technology.addIngredient("bullet-damage-7", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("gun-turret-damage-7", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("shotgun-shell-damage-7", 1, "basic-automation-science-pack")
--MoreScience.lib.technology.addIngredient("grenade-damage-7", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("flamethrower-damage-7", 1, "basic-automation-science-pack")
--MoreScience.lib.technology.addIngredient("laser-turret-damage-8", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("rocket-damage-7", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("cannon-shell-damage-6", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("combat-robot-damage-6", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("artillery-shell-range-1", 1, "basic-automation-science-pack")
MoreScience.lib.technology.addIngredient("artillery-shell-speed-1", 1, "basic-automation-science-pack")
