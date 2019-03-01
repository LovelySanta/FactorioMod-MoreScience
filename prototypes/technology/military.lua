
for prerequisite,techName in pairs{
--------------------------------------------------------------------------------
----- military                                                             -----
--------------------------------------------------------------------------------
  ["military"] = {
    "turrets"    ,
    "stone-walls",
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
  ["military-science-pack"] = {
    "weapon-shooting-speed-3"     ,
    "physical-projectile-damage-3",
    "stronger-explosives-2"       ,
    "flight"                      ,
  },

} do
  if not MoreScience.lib.table.isTable(techName) then
    MoreScience.lib.technology.addPrerequisite(techName, prerequisite)
  else
    for _,tech in pairs(techName) do
      MoreScience.lib.technology.addPrerequisite(tech, prerequisite)
    end
  end
end
