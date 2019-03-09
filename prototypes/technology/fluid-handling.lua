local techName     = "fluid-handling"
local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Fluid handling 1 (barreling oil/water, tanks, pipes)                 -----
--------------------------------------------------------------------------------

-- create the technology
LSlib.technology.removeIngredient(techName, string.format(scienceNames.green, "pack"))
LSlib.technology.removePrerequisite(techName, "engine")

-- add prerequisites for this technology
LSlib.technology.movePrerequisite(techName, "automation-2", "automation")
LSlib.technology.addPrerequisite(techName, "logistics")
LSlib.technology.addPrerequisite(techName, "steel-processing")

-- add recipe unlocks
for _,recipeName in pairs{
  "pipe-to-ground",
} do
  LSlib.recipe.disable(recipeName)
  LSlib.technology.addRecipeUnlock(techName, recipeName)
end
LSlib.technology.moveRecipeUnlock(techName, techName, "empty-barrel") -- this is just for unlock ordening

-- add prerequisites on this technology
--LSlib.technology.addPrerequisite("oil-processing", techName)



--------------------------------------------------------------------------------
----- Fluid handling 2 (barreling refined oil products)                    -----
--------------------------------------------------------------------------------

-- create the technology
local fluidHandling2 = util.table.deepcopy(data.raw["technology"][techName])
fluidHandling2.name = techName .. "-2"
fluidHandling2.effects = nil -- data-updates.lua --> adding oil barreling
fluidHandling2.prerequisites = {}
fluidHandling2.unit = util.table.deepcopy(data.raw["technology"]["engine"].unit)
data:extend{fluidHandling2}

-- add prerequisites for this technology
LSlib.technology.addPrerequisite(fluidHandling2.name, techName)
LSlib.technology.addPrerequisite(fluidHandling2.name, "engine")
LSlib.technology.addPrerequisite(fluidHandling2.name, "automation-2")
LSlib.technology.addPrerequisite(fluidHandling2.name, "oil-processing")

-- other technologies that depend on this one
for _,tech in pairs{
  "lubricant",
  "sulfur-processing",
} do
  LSlib.technology.addPrerequisite(tech, fluidHandling2.name)
end

-- add recipe unlocks
LSlib.technology.moveRecipeUnlock(techName, fluidHandling2.name, "pump")

-- split sulfur processing
local sulfur = util.table.deepcopy(data.raw["technology"]["sulfur-processing"])
sulfur.name = "sulfur"
sulfur.effects = nil
sulfur.prerequisites = {}
sulfur.unit = util.table.deepcopy(fluidHandling2.unit)
data:extend{sulfur}
LSlib.technology.addPrerequisite(sulfur.name, "oil-processing")
LSlib.technology.moveRecipeUnlock(sulfur.name.."-processing", sulfur.name, "sulfur")
LSlib.technology.movePrerequisite(sulfur.name.."-processing", "oil-processing", sulfur.name)
LSlib.technology.movePrerequisite("explosives", sulfur.name.."-processing", sulfur.name)

--------------------------------------------------------------------------------
----- Fluid handling 3 (barreling science fluids, fluid wagon)             -----
--------------------------------------------------------------------------------
-- create the technology
local fluidHandling3 = util.table.deepcopy(data.raw["technology"][techName])
fluidHandling3.name = techName .. "-3"
fluidHandling3.effects = nil -- data-updates.lua --> adding science barreling
fluidHandling3.prerequisites = {}
fluidHandling3.unit = util.table.deepcopy(data.raw["technology"]["advanced-material-processing-2"].unit)
data:extend{fluidHandling3}

-- add prerequisites for this technology
LSlib.technology.addPrerequisite(fluidHandling3.name, fluidHandling2.name)
LSlib.technology.addPrerequisite(fluidHandling3.name, string.format(scienceNames.blue, "pack"))
LSlib.technology.addPrerequisite(fluidHandling3.name, string.format(scienceNames.cyan, "pack"))

-- other technologies that depend on this one
for _,tech in pairs{
  "fluid-wagon",
} do
  LSlib.technology.addPrerequisite(tech, fluidHandling3.name)
end
