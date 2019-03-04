local scienceNames = require("prototypes/settings").scienceNames
local rocketParts  = require("prototypes/settings").rocketParts
local payloads     = require("prototypes/settings").rocketPayloads

--------------------------------------------------------------------------------
----- space-science-packs                                                  -----
--------------------------------------------------------------------------------

-- basic crate prototype
local cratePrototype = util.table.deepcopy(data.raw["item"]["wooden-chest"])
cratePrototype.name = string.format(rocketParts.payload, "mk1", "%s")
cratePrototype.place_result = nil

cratePrototype.icon      = nil
cratePrototype.icon_size = nil
cratePrototype.icons     = MoreScience.lib.item.getIcons("item", "infinity-chest", 1, {0,0}, nil) or {}

cratePrototype.subgroup = "ms-science-" .. rocketParts.subgroup
cratePrototype.order    = "m-a[%s]"

-- payload to put into the rocket
local rocketPayload = util.table.deepcopy(cratePrototype)
rocketPayload.name = string.format(rocketPayload.name, "empty")
rocketPayload.order = string.format(rocketPayload.order, "empty")

local rocketPayloadIcons = MoreScience.lib.item.getIcons("item", "empty-bottle", .48, {0,8}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}

-- result to get out of the rocket
rocketPayload = util.table.deepcopy(cratePrototype)
rocketPayload.name = string.format(rocketPayload.name, "full")
rocketPayload.order = string.format(rocketPayload.order, "full")

local rocketPayloadIcons = MoreScience.lib.item.getIcons("tool", string.format(scienceNames.white, "pack"), .48, {0,8}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}


-- satellite
data.raw["item"]["satellite"].subgroup = cratePrototype.subgroup
data.raw["item"]["satellite"].order    = "m-b[satellite]"
