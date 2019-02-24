
for prerequisite,techName in pairs{
--------------------------------------------------------------------------------
----- military                                                             -----
--------------------------------------------------------------------------------
  ["military"] = {
    "turrets",
    "stone-walls",
  },

--------------------------------------------------------------------------------
----- military-2                                                           -----
--------------------------------------------------------------------------------
  ["military-2"] = {
    "gun-turret-damage-1",
    "bullet-damage-2",
    "bullet-speed-2",
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
