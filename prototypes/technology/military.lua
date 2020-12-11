local scienceNames = require("prototypes/settings").scienceNames

for prerequisite,techName in pairs{
--------------------------------------------------------------------------------
----- military                                                             -----
--------------------------------------------------------------------------------
  ["military"] = {
    "turrets"    ,
    "stone-wall",
  },

--------------------------------------------------------------------------------
----- military-2                                                           -----
--------------------------------------------------------------------------------
  ["military-2"] = {
    "explosives"                  ,
    "weapon-shooting-speed-2"     ,
    "physical-projectile-damage-2",
  },

--------------------------------------------------------------------------------
----- military-science-pack                                                -----
--------------------------------------------------------------------------------
  [string.format(scienceNames.gray, "pack")] = {
    "weapon-shooting-speed-3"     ,
    "physical-projectile-damage-3",
    "stronger-explosives-2"       ,
    "flight"                      ,
  },

--------------------------------------------------------------------------------
----- military-3                                                           -----
--------------------------------------------------------------------------------
  ["military-3"] = {
    "laser-turret-speed-3",
    "refined-flammables-3",
    "power-armor"         ,
  },

--------------------------------------------------------------------------------
----- military-3                                                           -----
--------------------------------------------------------------------------------
  ["military-4"] = {
    "stronger-explosives-6"       ,
    "refined-flammables-4"        ,
    "laser-turret-speed-5"        ,
  },
} do
  if not LSlib.utils.table.isTable(techName) then
    LSlib.technology.addPrerequisite(techName, prerequisite)
  else
    for _,tech in pairs(techName) do
      LSlib.technology.addPrerequisite(tech, prerequisite)
    end
  end
end

--------------------------------------------------------------------------------
----- other military related upgrades                                      -----
--------------------------------------------------------------------------------
-- move rocket damage bonus from stronger explosives 3 to rocketry + update the tech icon
local effect = {}
if data.raw["technology"]["stronger-explosives-3"]         and
   data.raw["technology"]["stronger-explosives-3"].effects and
   data.raw["technology"]["stronger-explosives-2"]         and
   data.raw["technology"]["rocketry"             ]         then

  -- make sure the new tech effects exist
  if not data.raw["technology"]["rocketry"].effects then
    data.raw["technology"]["rocketry"].effects = {}
  end

  -- move the tech effect
  for effectIndex, effect in pairs(data.raw["technology"]["stronger-explosives-3"].effects) do
    if effect.type == "ammo-damage" and effect.ammo_category == "rocket" then
      table.insert(data.raw["technology"]["rocketry"             ].effects, util.table.deepcopy(effect))
      table.remove(data.raw["technology"]["stronger-explosives-3"].effects, effectIndex                )
      break
    end
  end

  -- update the tech icon
  data.raw["technology"]["stronger-explosives-3"].icon      = data.raw["technology"]["stronger-explosives-2"].icon
  data.raw["technology"]["stronger-explosives-3"].icon_size = data.raw["technology"]["stronger-explosives-2"].icon_size
  data.raw["technology"]["stronger-explosives-3"].icons     = data.raw["technology"]["stronger-explosives-2"].icons
end
