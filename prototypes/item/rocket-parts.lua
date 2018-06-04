

local function createRocketPart(name, order)
  local rocketPart =
  {
    type = "item",
    name = name,
    icon = "__MoreScience__/graphics/icons/" .. name .. ".png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "rocket-parts",
    order = "a[rocket-part]-a[" .. order .. "]-a[" .. name .. "]",
    stack_size = 100
  }

  data:extend({
    rocketPart,
  })
end

createRocketPart("rocketpart-hull-component", "a")

createRocketPart("rocketpart-ion-thruster", "b1")
createRocketPart("rocketpart-ion-booster", "b2")

createRocketPart("rocketpart-fusion-reactor", "c")

createRocketPart("rocketpart-shield-array", "d1")
createRocketPart("rocketpart-laser-array", "d2")


-- satellite is also a rocket part
data.raw["item"]["satellite"].subgroup = "rocket-parts"
