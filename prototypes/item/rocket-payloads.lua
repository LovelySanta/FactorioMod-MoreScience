local scienceNames = require("prototypes/settings").scienceNames
local rocketParts  = require("prototypes/settings").rocketParts
local payloads     = require("prototypes/settings").rocketPayloads
local rocket       = require("prototypes/settings").rocket

--------------------------------------------------------------------------------
----- space-science-packs                                                  -----
--------------------------------------------------------------------------------

-- basic crate prototype
local cratePrototype = data.raw["item"][string.format(rocketParts.container, "mk1")]

cratePrototype.icon      = nil
cratePrototype.icon_size = nil
cratePrototype.icons     = LSlib.item.getIcons("item", "infinity-chest", 1, {0,0}, nil) or {}

cratePrototype.stack_size = 1

cratePrototype = util.table.deepcopy(cratePrototype)
cratePrototype.name = string.format(rocketParts.payload, "mk1", "%s")
cratePrototype.subgroup = "ms-science-" .. rocket.subgroup
cratePrototype.order    = "d[payloads]-%s"

-- payload to put into the rocket
local rocketPayload = util.table.deepcopy(cratePrototype)
rocketPayload.name = string.format(rocketPayload.name, "empty-bottle")
rocketPayload.order = string.format(rocketPayload.order, "a1[empty-bottle]")

local rocketPayloadIcons = LSlib.item.getIcons("item", "empty-bottle", .48, {0,8}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}

-- result to get out of the rocket
rocketPayload = util.table.deepcopy(cratePrototype)
rocketPayload.name = string.format(rocketPayload.name, string.format(scienceNames.white, "pack"))
rocketPayload.order = string.format(rocketPayload.order, "a2["..string.format(scienceNames.white, "pack").."]")

local rocketPayloadIcons = LSlib.item.getIcons("tool", string.format(scienceNames.white, "pack"), .48, {0,8}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}
