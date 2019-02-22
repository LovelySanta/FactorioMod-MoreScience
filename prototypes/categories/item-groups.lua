
-- science pack group
data.raw["item-subgroup"]["science-pack"].group = "ms-science"

-- rocket parts
local rocketParts = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
rocketParts.name = "rocket-parts"
rocketParts.order = rocketParts.order .. "-a[rocket]-a"


data:extend{
  {
    type = "item-group",
    name = data.raw["item-subgroup"]["science-pack"].group,
    order = "e",
    icon = "__MoreScience__/graphics/item-group/science-bottles.png",
    icon_size = 512,
  },

  -- subgroups
  rocketParts,
}
