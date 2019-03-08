local scienceNames = require("prototypes/settings").scienceNames

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
local rocketTechName = "rocket"
-- Create rocket research
addRocketScienceTechnology(rocketTechName, nil)
data.raw["technology"][rocketTechName].icon_size = 250
data.raw["technology"][rocketTechName].unit.count = data.raw["technology"][rocketTechName].unit.count / 2
MoreScience.lib.technology.removeRecipeUnlock(rocketTechName, rocketTechName)
MoreScience.lib.technology.removePrerequisite("rocket-silo", rocketTechName)

-- Move prerequisites
for _,prerequisite in pairs(util.table.deepcopy(data.raw["technology"]["rocket-silo"].prerequisites)) do
  MoreScience.lib.technology.removePrerequisite("rocket-silo", prerequisite)
  MoreScience.lib.technology.addPrerequisite(rocketTechName, prerequisite)
end
MoreScience.lib.technology.addPrerequisite(rocketTechName, string.format(scienceNames.pink, "pack"))

-- Add assembling machine unlock
MoreScience.lib.technology.addPrerequisite(rocketTechName, "automation-3")
MoreScience.lib.technology.addRecipeUnlock(rocketTechName, "rocket-assembling-machine")

--------------------------------------------------------------------------------
----- Rocket parts research                                                -----
--------------------------------------------------------------------------------

-- Update research order
data.raw["technology"]["rocket-silo"].order = data.raw["technology"][rocketTechName].order .. "-a"

-- Create rocket parts research
local rocketParts = require ("prototypes/settings").rocketParts
addRocketScienceTechnology(rocketParts.hull, {rocketTechName})

addRocketScienceTechnology(rocketParts.engine1, {rocketTechName})
MoreScience.lib.technology.addRecipeUnlock(rocketParts.engine1, rocketParts.engine2)

addRocketScienceTechnology(rocketParts.power, {rocketTechName, "fusion-reactor-equipment", "kovarex-enrichment-process"})

addRocketScienceTechnology(rocketParts.defence, {rocketTechName, "energy-shield-mk2-equipment", "discharge-defense-equipment"})
MoreScience.lib.technology.addRecipeUnlock(rocketParts.defence, rocketParts.attack)



--------------------------------------------------------------------------------
----- Rocket silo research                                                 -----
--------------------------------------------------------------------------------

-- update research oder
data.raw["technology"]["rocket-silo"].order = data.raw["technology"][rocketTechName].order .. "-b"

--MoreScience.lib.technology.addPrerequisite("rocket-silo", "solar-energy")
--MoreScience.lib.technology.addPrerequisite("rocket-silo", "electric-energy-accumulators-1")
