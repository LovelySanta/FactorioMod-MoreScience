require "util"

--------------------------------------------------------------------------------
----- Basic lab                                                            -----
--------------------------------------------------------------------------------
if data.raw["lab"]["lab"] then
  data.raw["lab"]["lab"].inputs =
  {
    "science-pack-1",
    "science-pack-2",
    "military-science-pack",
    "basic-automation-science-pack",
    "science-pack-3",
    "basic-power-science-pack",
    "production-science-pack",
    "basic-logistics-science-pack",
    "high-tech-science-pack",
    "space-science-pack",
  }

  data.raw["lab"]["lab"].localised_name = {"item-name.lab-mk1", {[1] = "item-name.lab"}}
end

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labBurner = util.table.deepcopy(data.raw["lab"]["lab"])
labBurner.name = "lab-burner"
labBurner.minable.result = "lab-burner"
labBurner.localised_name = {"item-name.lab-burner", {[1] = "item-name.lab"}}
labBurner.energy_usage = "250kW"
labBurner.energy_source =
  {
    type = "burner",
    fuel_category = "chemical",
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions = 0.1 / 3,
    smoke =
    {
      {
        name = "smoke",
        deviation = {0.1, 0.1},
        frequency = 3
      }
    }
  }
labBurner.module_specification.module_slots = 0

--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(data.raw["lab"]["lab"])
labMK2.name = "lab-mk2"
labMK2.minable.result = "lab-mk2"
labMK2.localised_name = {"item-name.lab-mk2", {[1] = "item-name.lab"}}
labMK2.inputs = {
  "infused-basic-science-pack-1",
  "infused-basic-science-pack-2",
  "infused-basic-military-science-pack",
  "infused-basic-automation-science-pack",
  "infused-basic-science-pack-3",
  "infused-basic-power-science-pack",
  "infused-advanced-science-pack-1",
  "infused-basic-logistics-science-pack",
  "infused-advanced-science-pack-2",
  "infused-extreme-science-pack",
}
labMK2.energy_usage = "250kW"
labMK2.module_specification.module_slots = 5



data:extend({
  labBurner,
  labMK2,
})
