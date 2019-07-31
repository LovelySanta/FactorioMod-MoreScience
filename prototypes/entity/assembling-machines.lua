
--------------------------------------------------------------------------------
----- Assembling machine 0 (hand crafting)                      -----
--------------------------------------------------------------------------------

table.insert(data.raw["character"     ]["character"].crafting_categories, "ms-manual-crafting")
table.insert(data.raw["god-controller"]["default"  ].crafting_categories, "ms-manual-crafting")



--------------------------------------------------------------------------------
----- Assembling machine 1,2,3                                             -----
--------------------------------------------------------------------------------

-- assembling machine 1 must have fluid connections
local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
if not assemblingMachine1.fluid_boxes then
  assemblingMachine1.fluid_boxes = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes)
  --[[
  for _,fluidBox in pairs(assemblingMachine1.fluid_boxes) do
    if type(fluidBox) == "table" then
      fluidBox.pipe_picture = nil
      fluidBox.pipe_covers = nil
    end
  end
  ]]
  table.insert(assemblingMachine1.crafting_categories, "crafting-with-fluid")
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

-- all plants must be able to craft science fluids
for _,assemblingName in pairs{
  "chemical-plant",
} do
  table.insert(data.raw["assembling-machine"][assemblingName].crafting_categories, "ms-chemical-crafting")
end



--------------------------------------------------------------------------------
----- Assembling machine 4 (rocket assembling)                             -----
--------------------------------------------------------------------------------
-- rocket-assembling-machine (no fluid connections)
local rocketAssembling = util.table.deepcopy(assemblingMachine1)
rocketAssembling.name = "rocket-assembling-machine"
rocketAssembling.localised_name = nil

rocketAssembling.icon      = data.raw["item"][rocketAssembling.name].icon
rocketAssembling.icon_size = data.raw["item"][rocketAssembling.name].icon_size
rocketAssembling.icons     = util.table.deepcopy(data.raw["item"][rocketAssembling.name].icons)

rocketAssembling.crafting_categories = {require("prototypes/settings").rocketParts.category}
rocketAssembling.crafting_speed = 1
rocketAssembling.energy_usage = "500kW"

rocketAssembling.fast_replaceable_group = nil
rocketAssembling.next_upgrade = nil

rocketAssembling.max_health = 450
rocketAssembling.minable.result = rocketAssembling.name

rocketAssembling.fluid_boxes = nil

rocketAssembling.animation = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].animation)
rocketAssembling.animation.layers[1]           .filename = "__MoreScience__/graphics/entity/assembling-machine-4/assembling-machine-4.png"
rocketAssembling.animation.layers[2]           .filename = "__MoreScience__/graphics/entity/assembling-machine-4/assembling-machine-4-shadow.png"
rocketAssembling.animation.layers[1].hr_version.filename = "__MoreScience__/graphics/entity/assembling-machine-4/hr-assembling-machine-4.png"
rocketAssembling.animation.layers[2].hr_version.filename = "__MoreScience__/graphics/entity/assembling-machine-4/hr-assembling-machine-4-shadow.png"

data:extend{rocketAssembling}



--------------------------------------------------------------------------------
----- Science cauldron                                                     -----
--------------------------------------------------------------------------------
if settings.startup["MS-rocket-launching-extended"].value == true then

  local scienceCauldron = util.table.deepcopy(assemblingMachine1)
  scienceCauldron.name = "science-cauldron"
  scienceCauldron.localised_name = nil

  scienceCauldron.icon      = data.raw["item"][scienceCauldron.name].icon
  scienceCauldron.icon_size = data.raw["item"][scienceCauldron.name].icon_size
  scienceCauldron.icons     = util.table.deepcopy(data.raw["item"][scienceCauldron.name].icons)

  scienceCauldron.crafting_categories = {require("prototypes/settings").rocketCauldron.category}
  scienceCauldron.crafting_speed = 0.075
  scienceCauldron.energy_usage = rocketAssembling.energy_usage

  scienceCauldron.max_health = rocketAssembling.max_health
  scienceCauldron.minable.result = scienceCauldron.name

  scienceCauldron.module_specification = { module_slots = 2 }
  scienceCauldron.allowed_effects = {"consumption", "speed", "pollution" }

  scienceCauldron.animation = {
    filename = "__MoreScience__/graphics/entity/cauldron/cauldron.png",
    width  = 800 / 5,
    height = 800 / 5,
    frame_count = 5 * 5,
    line_length = 5,
    animation_speed = 5,
  }

  local function createCauldronPipePictures()
    return {
      north =
      {
        filename = "__MoreScience__/graphics/entity/cauldron/pipe-north.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        shift = {-1, 2},
      },
      east =
      {
        --filename = "__MoreScience__/graphics/entity/cauldron/pipe-east.png",
        filename = "__MoreScience__/graphics/entity/cauldron/pipe-east-alternative.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        shift = {-2, -1},
      },
      south =
      {
        filename = "__MoreScience__/graphics/entity/cauldron/pipe-south.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        shift = {1, -2},
      },
      west =
      {
        filename = "__MoreScience__/graphics/entity/cauldron/pipe-west.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        shift = {2, 1},
      },
    }
  end
  scienceCauldron.fluid_boxes = {
    { -- north
      production_type = "input",
      pipe_picture = createCauldronPipePictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 0.1, -- will hold 10 units
      base_level = -1,
      pipe_connections = {{ type="input", position = {1, -2} }}
    },
    { -- east
      production_type = "input",
      pipe_picture = createCauldronPipePictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 0.1, -- will hold 10 units
      base_level = -1,
      pipe_connections = {{ type="input", position = {2, 1} }}
    },
    { -- west
      production_type = "input",
      pipe_picture = createCauldronPipePictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 0.1, -- will hold 10 units
      base_level = -1,
      pipe_connections = {{ type="input", position = {-2, -1} }}
    },
    { -- south
      production_type = "output",
      pipe_picture = createCauldronPipePictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 0.1, -- will hold 10 units
      base_level = 1,
      pipe_connections = {{ type="output", position = {-1, 2} }}
    },
    --off_when_no_fluid_recipe = true
  }

  data:extend{scienceCauldron}
end
