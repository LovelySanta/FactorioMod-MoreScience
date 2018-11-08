
-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  "BobAngelsExtension",
  "ScienceCostTweakerExtension",
  "OmniExtension",
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  log("cleaning up the tech tree")
  MoreScience.lib.technology.removeAllRedundantPrerequisites()
end
