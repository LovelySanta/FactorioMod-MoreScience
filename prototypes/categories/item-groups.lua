
-- science pack group
data.raw["item-subgroup"]["science-pack"].group = "ms-science"

-- science bottling
local scienceBottling = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
scienceBottling.name = "science-bottling"
scienceBottling.order = scienceBottling.order .. "-a[science-basics]-a"

-- rocket parts
local rocketParts = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
rocketParts.name = "rocket-parts"
rocketParts.order = rocketParts.order .. "-b[science-rocket]-a"


data:extend{
  {
    type = "item-group",
    name = data.raw["item-subgroup"]["science-pack"].group,
    order = "e",
    icon = "__MoreScience__/graphics/item-group/science-bottles.png",
    icon_size = 512,
  },

  -- subgroups (science-basics)
  scienceBottling,

  -- subgroups (science-rocket)
  rocketParts,
}
