local subgroup = require("prototypes/settings").rocketParts.subgroup
data:extend{
  {
    type = "item",
    name = "rocket-assembling-machine",
    icon = "__MoreScience__/graphics/icons/assembling-machine-4.png",
    icon_size = 64,
    --flags = {},
    subgroup = "ms-science-" .. subgroup,
    order = "a[" .. subgroup .. "]-a-a[assembling-machine]",
    place_result = "rocket-assembling-machine",
    stack_size = data.raw["item"]["assembling-machine-1"].stack_size,
  },
}
