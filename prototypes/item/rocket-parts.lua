local rocketParts = require ("prototypes/settings").rocketParts

local function createRocketPart(name, order)
  data:extend{{
    type = "item",
    name = name,
    icon = "__MoreScience__/graphics/icons/" .. name .. ".png",
    icon_size = 32,
    flags = nil,
    subgroup = "ms-science-" .. rocketParts.subgroup,
    order = "a[" .. rocketParts.subgroup .. "]-a[" .. order .. "]-a[" .. name .. "]",
    stack_size = 100
  }}
end

createRocketPart(rocketParts.hull   , "b" )
createRocketPart(rocketParts.engine1, "c1")
createRocketPart(rocketParts.engine2, "c2")
createRocketPart(rocketParts.power  , "d" )
createRocketPart(rocketParts.defence, "e1")
createRocketPart(rocketParts.attack , "e2")

-- satellite is also a rocket part
data.raw["item"]["satellite"].subgroup = "ms-science-" .. rocketParts.subgroup
