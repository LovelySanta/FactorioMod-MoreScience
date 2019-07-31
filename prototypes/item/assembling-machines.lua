data:extend{{
  type = "item",
  name = "rocket-assembling-machine",
  icon = "__MoreScience__/graphics/icons/assembling-machine-4.png",
  icon_size = 64,
  --flags = {},
  subgroup = "ms-science-" .. require("prototypes/settings").rocketParts.subgroup,
  order = "a[" .. require("prototypes/settings").rocketParts.subgroup .. "]-a-a[assembling-machine]",
  place_result = "rocket-assembling-machine",
  stack_size = data.raw["item"]["assembling-machine-1"].stack_size,
}}

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "item",
    name = "science-cauldron",
    icon = "__MoreScience__/graphics/icons/cauldron.png",
    icon_size = 32,
    --flags = {},
    subgroup = "ms-science-" .. require("prototypes/settings").rocketCauldron.subgroup,
    order = "a[" .. require("prototypes/settings").rocketCauldron.subgroup .. "]-a-a[cauldron]",
    place_result = "science-cauldron",
    stack_size = data.raw["item"]["assembling-machine-1"].stack_size,
  }}

end
