
--------------------------------------------------------------------------------
----- Basic power science pack                                             -----
--------------------------------------------------------------------------------

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-power-science-research",
    icon = "__MoreScience__/graphics/technology/potions/potion-lightblue.png",
    icon_size = 128,
    prerequisites = {
      "basic-automation-science-research",
      "battery",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-power-science-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-power-science-pack"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 3},
        {"basic-automation-science-pack", 5},
      },
      time = 10
    },
    upgrade = false,
    order = "c-a"
  },
})

-- add prerequisites on the technology

-- power
MoreScience.lib.technology.addPrerequisite("electric-energy-distribution-2", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("electric-energy-distribution-2", 1, "basic-power-science-pack")
MoreScience.lib.technology.addPrerequisite("electric-energy-accumulators-1", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("electric-energy-accumulators-1", 1, "basic-power-science-pack")
MoreScience.lib.technology.addPrerequisite("solar-energy", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("solar-energy", 1, "basic-power-science-pack")
MoreScience.lib.technology.addPrerequisite("nuclear-power", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("nuclear-power", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("nuclear-fuel-reprocessing", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("kovarex-enrichment-process", 1, "basic-power-science-pack")

-- power modules
MoreScience.lib.technology.addPrerequisite("effectivity-module", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("effectivity-module", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("effectivity-module-2", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("effectivity-module-3", 1, "basic-power-science-pack")

-- automation
MoreScience.lib.technology.addPrerequisite("electric-engine", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("electric-engine", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("flying", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("construction-robotics", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("logistic-robotics", 1, "basic-power-science-pack")

-- Laser turrets
MoreScience.lib.technology.addPrerequisite("laser-turrets", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("laser-turrets", 1, "basic-power-science-pack")

-- armor equipment
MoreScience.lib.technology.addPrerequisite("solar-panel-equipment", "solar-energy")
MoreScience.lib.technology.addIngredient("solar-panel-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("fusion-reactor-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addPrerequisite("battery-equipment", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("battery-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("battery-mk2-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("personal-laser-defense-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("discharge-defense-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addPrerequisite("energy-shield-equipment", "basic-power-science-research")
MoreScience.lib.technology.addIngredient("energy-shield-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("energy-shield-mk2-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("personal-roboport-equipment-2", 1, "basic-power-science-pack")

-- bonusses
MoreScience.lib.technology.addIngredient("laser-turret-damage-1", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-2", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-3", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-4", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-5", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-6", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-7", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-damage-8", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-1", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-2", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-3", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-4", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-5", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-6", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-7", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("laser-turret-speed-8", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-1", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-2", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-3", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-4", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-5", 1, "basic-power-science-pack")
--MoreScience.lib.technology.addIngredient("worker-robot-speed-6", 1, "basic-power-science-pack")
MoreScience.lib.technology.addIngredient("mining-productivity-16", 1, "basic-power-science-pack")
