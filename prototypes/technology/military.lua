
for _,techName in pairs{
  "turrets",
  "stone-walls",
} do
  MoreScience.lib.technology.addPrerequisite(techName, "military")
end
