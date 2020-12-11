local scienceNames   = require("prototypes/settings").scienceNames
local rocketParts    = require("prototypes/settings").rocketParts
local payloads       = require("prototypes/settings").rocketPayloads
local rocket         = require("prototypes/settings").rocket
local rocketCauldron = require("prototypes/settings").rocketCauldron

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
local itemInCrateName = settings.startup["MS-rocket-launching-extended"].value and string.format(scienceNames.mixing, "pack") or "empty-bottle"
rocketPayload.name = string.format(rocketPayload.name, itemInCrateName)
if settings.startup["MS-rocket-launching-extended"].value == true then
  rocketPayload.subgroup = "ms-science-" .. rocketCauldron.subgroup
else
  rocketPayload.subgroup = "ms-science-" .. rocketParts.subgroup
end
rocketPayload.order = "a[" .. rocketCauldron.subgroup .. "]-b-d"

local rocketPayloadIcons = LSlib.item.getIcons("item", itemInCrateName, 0.48*2, {0,16}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}

-- result to get out of the rocket
rocketPayload = util.table.deepcopy(cratePrototype)
rocketPayload.name = string.format(rocketPayload.name, string.format(scienceNames.white, "pack"))
rocketPayload.order = string.format(rocketPayload.order, "a2["..string.format(scienceNames.white, "pack").."]")

local rocketPayloadIcons = LSlib.item.getIcons("tool", string.format(scienceNames.white, "pack"), 0.48*2, {0,16}, nil)
for _,iconLayer in pairs(rocketPayloadIcons or {}) do
  table.insert(rocketPayload.icons, iconLayer)
end

data:extend{rocketPayload}
