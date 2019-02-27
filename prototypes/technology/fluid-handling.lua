local techName = "fluid-handling"

--------------------------------------------------------------------------------
----- Fluid handling 1 (barreling oil/water, tanks, pipes)                 -----
--------------------------------------------------------------------------------

-- create the technology
MoreScience.lib.technology.removeIngredient(techName, "logistic-science-pack")
MoreScience.lib.technology.removePrerequisite(techName, "engine")

-- add prerequisites for this technology
MoreScience.lib.technology.movePrerequisite(techName, "automation-2", "automation")
MoreScience.lib.technology.addPrerequisite(techName, "logistics")
MoreScience.lib.technology.addPrerequisite(techName, "steel-processing")

-- add recipe unlocks
for _,recipeName in pairs{
  "pipe-to-ground",
} do
  MoreScience.lib.recipe.disable(recipeName)
  MoreScience.lib.technology.addRecipeUnlock(techName, recipeName)
end
MoreScience.lib.technology.moveRecipeUnlock(techName, techName, "empty-barrel") -- this is just for unlock ordening

-- add prerequisites on this technology
--MoreScience.lib.technology.addPrerequisite("oil-processing", techName)



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
MoreScience.lib.technology.addPrerequisite(techName .. "-2", techName)
MoreScience.lib.technology.addPrerequisite(techName .. "-2", "engine")
MoreScience.lib.technology.addPrerequisite(techName .. "-2", "automation-2")
MoreScience.lib.technology.addPrerequisite(techName .. "-2", "oil-processing")

-- other technologies that depend on this one
for _,tech in pairs{
  "fluid-wagon",
  "lubricant",
} do
  MoreScience.lib.technology.addPrerequisite(tech, techName .. "-2")
end


-- add recipe unlocks
MoreScience.lib.technology.moveRecipeUnlock(techName, techName.."-2", "pump")
