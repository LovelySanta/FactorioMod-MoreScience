
-- assembling machine 1 must have fluid connections
local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
if not assemblingMachine1.fluid_boxes then
  assemblingMachine1.fluid_boxes = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes)
  for _,fluidBox in pairs(assemblingMachine1.fluid_boxes) do
    if type(fluidBox) == "table" then
      fluidBox.pipe_picture = nil
      fluidBox.pipe_covers = nil
    end
  end
end
table.insert(assemblingMachine1.crafting_categories, "ms-manual-crafting")
data.raw["assembling-machine"]["assembling-machine-1"] = assemblingMachine1



-- all assemblers must be able to craft science packs
for _,assemblingName in pairs{
  "assembling-machine-1",
  "assembling-machine-2",
  "assembling-machine-3",
} do
  table.insert(data.raw["assembling-machine"][assemblingName].crafting_categories, "ms-advanced-crafting")
end



-- rocket-assembling-machine (no fluid connections)
local rocketAssembling = util.table.deepcopy(assemblingMachine1)
rocketAssembling.name = "rocket-assembling-machine"
rocketAssembling.localised_name = nil

rocketAssembling.crafting_categories = {"ms-rocket-crafting"}
rocketAssembling.crafting_speed = 1
rocketAssembling.energy_usage = "500kW"

rocketAssembling.max_health = 450
rocketAssembling.minable.result = rocketAssembling.name

rocketAssembling.fluid_boxes = nil

rocketAssembling.animation = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].animation)
rocketAssembling.animation.layers[1]           .filename = "__MoreScience__/graphics/entity/assembling-machine-4/assembling-machine-4.png"
rocketAssembling.animation.layers[2]           .filename = "__MoreScience__/graphics/entity/assembling-machine-4/assembling-machine-4-shadow.png"
rocketAssembling.animation.layers[1].hr_version.filename = "__MoreScience__/graphics/entity/assembling-machine-4/hr-assembling-machine-4.png"
rocketAssembling.animation.layers[2].hr_version.filename = "__MoreScience__/graphics/entity/assembling-machine-4/hr-assembling-machine-4-shadow.png"

data:extend{rocketAssembling}
