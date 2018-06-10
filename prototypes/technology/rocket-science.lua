require 'util'

local function addRocketScienceTechnology(name, prerequisites)
  data:extend({
    {
      type = "technology",
      name = name,
      icon = "__MoreScience__/graphics/technology/" .. name .. "-tech.png",
      icon_size = 128,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = name,
        }
      },
      prerequisites = util.table.deepcopy(prerequisites),
      unit =
      {
        count = data.raw["technology"]["rocket-silo"].unit.count / 2,
        ingredients = data.raw["technology"]["rocket-silo"].unit.ingredients,
        time = data.raw["technology"]["rocket-silo"].unit.time,
      },
      order = data.raw["technology"]["rocket-silo"].order
    }
  })

  MoreScience.lib.technology.addPrerequisite("rocket-silo", name)
end


--------------------------------------------------------------------------------
----- Rocket research                                                      -----
--------------------------------------------------------------------------------
-- Create rocket research
addRocketScienceTechnology("rocket", nil)
data.raw["technology"]["rocket"].icon_size = 250
data.raw["technology"]["rocket"].unit.count = data.raw["technology"]["rocket"].unit.count / 2
MoreScience.lib.technology.removeRecipeUnlock("rocket", "rocket")
MoreScience.lib.technology.removePrerequisite("rocket-silo", "rocket")

-- Move prerequisites
for _,prerequisite in pairs(util.table.deepcopy(data.raw["technology"]["rocket-silo"].prerequisites)) do
  MoreScience.lib.technology.removePrerequisite("rocket-silo", prerequisite)
  MoreScience.lib.technology.addPrerequisite("rocket", prerequisite)
end

-- Move recipe unlocks
for _,recipe in pairs ({
  "low-density-structure",
  "rocket-fuel",
  "rocket-control-unit",
}) do
  MoreScience.lib.technology.removeRecipeUnlock("rocket-silo", recipe)
  MoreScience.lib.technology.addRecipeUnlock("rocket", recipe)
end

--------------------------------------------------------------------------------
----- Rocket parts research                                                -----
--------------------------------------------------------------------------------

-- Update research order
data.raw["technology"]["rocket-silo"].order = data.raw["technology"]["rocket"].order .. "-a"

-- Create rocket parts research
addRocketScienceTechnology("rocketpart-hull-component", {"rocket"})

addRocketScienceTechnology("rocketpart-ion-thruster", {"rocket"})
MoreScience.lib.technology.addRecipeUnlock("rocketpart-ion-thruster", "rocketpart-ion-booster")

addRocketScienceTechnology("rocketpart-fusion-reactor", {"rocket", "fusion-reactor-equipment", "kovarex-enrichment-process"})

addRocketScienceTechnology("rocketpart-shield-array", {"rocket", "energy-shield-mk2-equipment", "discharge-defense-equipment"})
MoreScience.lib.technology.addRecipeUnlock("rocketpart-shield-array", "rocketpart-laser-array")



--------------------------------------------------------------------------------
----- Rocket silo research                                                 -----
--------------------------------------------------------------------------------

-- update research oder
data.raw["technology"]["rocket-silo"].order = data.raw["technology"]["rocket"].order .. "-b"

--MoreScience.lib.technology.addPrerequisite("rocket-silo", "solar-energy")
MoreScience.lib.technology.addPrerequisite("rocket-silo", "electric-energy-accumulators-1")
