local ms_science_packs = {
  ["science-pack-1"               ] = 1,
  ["science-pack-2"               ] = 2,
  ["military-science-pack"        ] = 3,
  --["basic-automation-science-pack"] = 4,
  ["science-pack-3"               ] = 5,
  --["basic-power-science-pack"     ] = 6,
  ["production-science-pack"      ] = 7,
  --["basic-logistics-science-pack" ] = 8,
  ["high-tech-science-pack"       ] = 9,
  ["space-science-pack"           ] = 10,
}



--------------------------------------------------------------------------------
----- Basic lab                                                            -----
--------------------------------------------------------------------------------
local sciencePacks = util.table.deepcopy(ms_science_packs)
local nextScienceIndex = 11

if data.raw["lab"]["lab"] then
  for _,sciencePackName in pairs(data.raw["lab"]["lab"].inputs) do
    if not ms_science_packs[sciencePackName] then
      -- a science pack from another mod
      sciencePacks[sciencePackName] = nextScienceIndex
      nextScienceIndex = nextScienceIndex + 1
    end
  end

  data.raw["lab"]["lab"].inputs = {}
  for sciencePackName, sciencePackLocation in pairs(sciencePacks) do
    data.raw["lab"]["lab"].inputs[sciencePackLocation] = sciencePackName
  end

  data.raw["lab"]["lab"].localised_name = {"item-tier-name.mk1", {[1] = "item-name.lab"}}
end



--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["lab"]["lab"])
labMK0.name = "lab-mk0"
labMK0.minable.result = "lab-mk0"
labMK0.localised_name = {"item-tier-name.mk0", {[1] = "item-name.lab"}}
labMK0.energy_usage = "250kW"
labMK0.energy_source =
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
labMK0.module_specification.module_slots = 0
data:extend{labMK0}
