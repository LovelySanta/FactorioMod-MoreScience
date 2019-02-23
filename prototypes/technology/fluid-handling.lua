local techName = "fluid-handling"

--------------------------------------------------------------------------------
----- Fluid handling 1 (barreling oil/water, tanks, pipes)                 -----
--------------------------------------------------------------------------------

-- add prerequisites for this technology
MoreScience.lib.technology.movePrerequisite(techName, "automation-2", "automation")
MoreScience.lib.technology.addPrerequisite(techName, "logistics")

-- add recipe unlocks
for _,recipeName in pairs{
  "pipe-to-ground",
} do
  MoreScience.lib.recipe.disable(recipeName)
  MoreScience.lib.technology.addRecipeUnlock(techName, recipeName)
end
MoreScience.lib.technology.moveRecipeUnlock(techName, techName, "empty-barrel") -- this is just for unlock ordening

-- add prerequisites on this technology
MoreScience.lib.technology.addPrerequisite("oil-processing", techName)



--------------------------------------------------------------------------------
----- Fluid handling 2 (barreling refined oil products)                    -----
--------------------------------------------------------------------------------

-- create the technology
local fluidHandling2 = util.table.deepcopy(data.raw["technology"][techName])
fluidHandling2.name = techName .. "-2"
fluidHandling2.effects = nil -- data-updates.lua --> adding oil barreling
fluidHandling2.prerequisites =
{
  techName,
  "oil-processing",
}
fluidHandling2.unit = util.table.deepcopy(data.raw["technology"]["oil-processing"].unit)
data:extend{fluidHandling2}
