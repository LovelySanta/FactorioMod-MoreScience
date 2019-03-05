
--------------------------------------------------------------------------------
----- science pack group                                                   -----
--------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------
----- science pack subgroup                                                -----
--------------------------------------------------------------------------------
local subgroupOrdering = data.raw["item-subgroup"]["science-pack"].order
local function createSubgroup(subgroupName, subgroupOrder)
  local subgroup = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
  subgroup.name = "ms-science-" .. subgroupName
  subgroup.order = subgroupOrdering .. subgroupOrder .. "["..subgroupName.."]"
  data:extend{subgroup}
end

-- science-basics
createSubgroup("raw-material", "-a[science-basics]-a")

-- science bottling
createSubgroup("bottling"    , "-b[science-bottling]-a")
createSubgroup("fluid"       , "-b[science-bottling]-b")

createSubgroup("barrel"      , "-b[science-bottling]-c1")
createSubgroup("barrel-fill" , "-b[science-bottling]-c2")
createSubgroup("barrel-empty", "-b[science-bottling]-c3")

createSubgroup("infused-science-pack", "-c[science-pack]-b")

-- science rocket
local rocketParts = require ("prototypes/settings").rocketParts
createSubgroup(rocketParts.subgroup, "-d[science-rocket]-a")
local rocket      = require ("prototypes/settings").rocket
createSubgroup(rocket.subgroup     , "-d[science-rocket]-b")

-- science pack
MoreScience.lib.item.setOrderstring("item-subgroup", "science-pack", subgroupOrdering .. "-c[science-pack]-a")
