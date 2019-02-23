
-- science pack group
data.raw["item-subgroup"]["science-pack"].group = "ms-science"
data:extend{
  {
    type = "item-group",
    name = data.raw["item-subgroup"]["science-pack"].group,
    order = "e",
    icon = "__MoreScience__/graphics/item-group/science-bottles.png",
    icon_size = 512,
  },
}

local function createSubgroup(subgroupName, subgroupOrder)
  local subgroup = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
  subgroup.name = "ms-science-" .. subgroupName
  subgroup.order = subgroup.order .. subgroupOrder .. "["..subgroupName.."]"
  data:extend{subgroup}
end



-- science-basics
createSubgroup("raw-material", "-a[science-basics]-a")

-- science bottling
createSubgroup("bottling"    , "-b[science-bottling]-a")
createSubgroup("fluid"       , "-b[science-bottling]-b")

-- science rocket
createSubgroup("rocketparts", "-c[science-rocket]-a")
