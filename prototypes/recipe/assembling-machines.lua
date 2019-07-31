
data:extend{{
  type = "recipe",
  name = "rocket-assembling-machine",
  energy_required = 25,
  category = "crafting",
  ingredients =
  {
    {"assembling-machine-3", 1},
    {"low-density-structure", 10},
    {"rocket-control-unit", 1},
  },
  result = "rocket-assembling-machine",
  result_count = 1,
  enabled = false,
}}

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "recipe",
    name = "science-cauldron",
    --energy_required = 25,
    category = "crafting",
    ingredients =
    {
      {"storage-tank", 1},
      {"electric-furnace", 1},
      {"pipe-to-ground", 8},
    },
    result = "science-cauldron",
    result_count = 1,
    enabled = false,
  }}
  
end
