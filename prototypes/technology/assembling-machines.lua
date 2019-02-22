
local rocketAssemblingMachine = util.table.deepcopy(data.raw["technology"]["automation-3"])
rocketAssemblingMachine.name = "rocket-assembling"
rocketAssemblingMachine.prerequisites =
{
  "automation-3",
}
rocketAssemblingMachine.effects =
{
  {
    type = "unlock-recipe",
    recipe = "rocket-assembling-machine",
  }
}
data:extend{rocketAssemblingMachine}
