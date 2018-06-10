
--------------------------------------------------------------------------------
----- Landfill:                                                            -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.addPrerequisite("landfill", "basic-science-research-1")



--------------------------------------------------------------------------------
----- Fluid handling                                                       -----
--------------------------------------------------------------------------------

-- disable the recipes
MoreScience.lib.recipe.disable("pipe-to-ground")

-- remove recipe unlock
--removeRecipeUnlock("fluid-handling", "storage-tank")
MoreScience.lib.technology.addRecipeUnlock("fluid-handling", "pipe-to-ground")

-- add prerequisites
MoreScience.lib.technology.addPrerequisite("oil-processing", "fluid-handling")



-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "fluid-handling-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/fluid-handling.png",
    prerequisites =
    {
      "fluid-handling",
      "basic-science-research-2",
      "oil-processing"
    },
    effects = nil, -- data-final-fixes.lua --> adding oil barreling
    --{
      --{
      --  type = "unlock-recipe",
      --  recipe = "storage-tank"
      --},
      --{
      --  type = "unlock-recipe",
      --  recipe = "pipe-to-ground"
      --},
    --},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"basic-automation-science-pack", 1},
      },
      time = 60
    },
    order = "d-a-a"
  },
})
MoreScience.lib.technology.removePrerequisite("fluid-wagon", "fluid-handling")
MoreScience.lib.technology.addPrerequisite("fluid-wagon", "fluid-handling-2")



-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "fluid-handling-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/fluid-handling.png",
    prerequisites =
    {
      "fluid-handling-2",
      "basic-logistics-science-research",
    },
    effects = nil, -- data-final-fixes.lua --> adding science barreling
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"basic-logistics-science-pack", 1},
      },
      time = 60
    },
    order = "d-a-a"
  },
})

--------------------------------------------------------------------------------
----- Basic logistics science research                                     -----
--------------------------------------------------------------------------------

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-logistics-science-research",
    icon = "__MoreScience__/graphics/technology/science-symbol.png",
    icon_size = 2000,
    prerequisites =
    {
      --"basic-science-research-2",
      "electric-engine",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-logistics-science-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-logistics-science-pack"
      },
    },
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"basic-automation-science-pack", 3},
        {"science-pack-3", 4},
        {"basic-power-science-pack", 5},
      },
      time = 30
    },
    order = "d-a-b"
  },
})

-- add prerequisites on the technology
MoreScience.lib.technology.addPrerequisite("logistics-2", "basic-logistics-science-research")
MoreScience.lib.technology.addIngredient("logistics-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("logistics-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addPrerequisite("logistics-3", "basic-logistics-science-research")
MoreScience.lib.technology.addIngredient("automobilism", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("tanks", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("stack-inserter", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addPrerequisite("rocket-silo", "basic-logistics-science-research")

-- train network
MoreScience.lib.technology.removePrerequisite("railway", "logistics-2")
--MoreScience.lib.technology.addPrerequisite("railway", "basic-logistics-science-research")
--MoreScience.lib.technology.addIngredient("railway", 1, "basic-logistics-science-pack")
--MoreScience.lib.technology.addIngredient("automated-rail-transportation", 1, "basic-logistics-science-pack")
--MoreScience.lib.technology.addPrerequisite("rail-signals", "basic-logistics-science-research")
--MoreScience.lib.technology.addIngredient("rail-signals", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("fluid-wagon", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addPrerequisite("fluid-wagon", "basic-logistics-science-research")

-- robot network
MoreScience.lib.technology.addPrerequisite("robotics", "basic-logistics-science-research")
MoreScience.lib.technology.addIngredient("robotics", 1, "basic-logistics-science-pack")
--MoreScience.lib.technology.addIngredient("flying", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("construction-robotics", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("logistic-robotics", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("logistic-system", 1, "basic-logistics-science-pack")

MoreScience.lib.technology.addIngredient("character-logistic-slots-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-4", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-5", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-slots-6", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-trash-slots-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("character-logistic-trash-slots-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("auto-character-logistic-trash-slots", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment-2", 1, "basic-logistics-science-pack")

-- inserters bonus
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-4", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-5", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-6", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-7", 1, "basic-logistics-science-pack")

-- train bonus
MoreScience.lib.technology.addPrerequisite("braking-force-1", "logistics-2")
MoreScience.lib.technology.addIngredient("braking-force-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-4", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-5", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-6", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("braking-force-7", 1, "basic-logistics-science-pack")

-- robot bonus
MoreScience.lib.technology.addIngredient("worker-robots-storage-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-storage-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-storage-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-1", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-2", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-3", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-4", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-5", 1, "basic-logistics-science-pack")
MoreScience.lib.technology.addIngredient("worker-robots-speed-6", 1, "basic-logistics-science-pack")
