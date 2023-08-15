local scienceNames     = require("prototypes/settings").scienceNames

local sciencePackNames = {
  scienceNames.red   ,
  scienceNames.green ,
  scienceNames.gray  ,
  scienceNames.orange,
  scienceNames.cyan  ,
  scienceNames.blue  ,
  scienceNames.purple,
  scienceNames.yellow,
  scienceNames.pink  ,
  scienceNames.white ,
}

local function removeSciencePackFromInputs(scienceName, inputs)
  for inputIndex,input in pairs(inputs or {}) do
    if input == string.format(scienceName, "pack") then
      table.remove(inputs, inputIndex)
      break
    end
  end
  return inputs
end



--------------------------------------------------------------------------------
----- Basic lab                                                            -----
--------------------------------------------------------------------------------
local labMK1 = data.raw["lab"]["lab"]

-- remove vanilla science packs
local inputs = labMK1.inputs
for _,scienceName in pairs(sciencePackNames) do
  inputs = removeSciencePackFromInputs(scienceName, inputs)
end
-- now add them again in the correct order
for scienceIndex,scienceName in pairs(sciencePackNames) do
  table.insert(inputs, scienceIndex, string.format(scienceName, "pack"))
end

labMK1.localised_name = {"item-tier-name.mk1", {[1] = "item-name.lab"}}
labMK1.fast_replaceable_group = labMK1.name


--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(labMK1)
labMK0.next_upgrade = labMK0.name
labMK0.name = "lab-mk0"
labMK0.localised_name[1] = "item-tier-name.mk0"

labMK0.minable.result = labMK0.name
labMK0.energy_usage = "250kW"
labMK0.energy_source =
{
  type = "burner",
  fuel_category = "chemical",
  effectivity = 1,
  fuel_inventory_size = 1,
  --emissions_per_second_per_watt = 3.33333e-05,
  emissions_per_minute = 9,
  smoke =
  {
    {
      name = "smoke",
      deviation = {0.1, 0.1},
      frequency = 3
    }
  }
}
labMK0.module_specification.module_slots = 0

-- inputs
for _,scienceName in pairs(sciencePackNames) do
  labMK0.inputs = removeSciencePackFromInputs(scienceName, labMK0.inputs)
end
table.insert(labMK0.inputs, 1, string.format(scienceNames.red, "pack"))

data:extend{labMK0}
if DiscoScience and DiscoScience.prepareLab then
  DiscoScience.prepareLab(data.raw["lab"]["lab-mk0"])
end



--------------------------------------------------------------------------------
----- Lab Mk2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(labMK1)
labMK2.name = "lab-mk2"
labMK2.localised_name[1] = "item-tier-name.mk2"
labMK1.next_upgrade = labMK2.name
labMK2.minable.result = labMK2.name
labMK2.module_specification.module_slots = 2 * labMK2.module_specification.module_slots
labMK2.researching_speed = .5 * labMK2.researching_speed
labMK2.energy_usage = "500kW"

-- inputs
for inputIndex, input in pairs(labMK2.inputs) do
  for _,scienceName in pairs(sciencePackNames) do
    if input == string.format(scienceName, "pack") then
      labMK2.inputs[inputIndex] = "infused-" .. labMK2.inputs[inputIndex]
    end
  end
end

data:extend{labMK2}
if DiscoScience and DiscoScience.prepareLab then
  DiscoScience.prepareLab(data.raw["lab"]["lab-mk2"])
end
