
-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  "BobAngelsExtension",
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  MoreScience.lib.technology.removeAllRedundantPrerequisites()
end
