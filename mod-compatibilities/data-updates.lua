
for _, modName in pairs({
  "CorpseFlare",
  "logicarts",
  "NuclearFuel",
  "qol_research",
  "Vehicle Wagon"
}) do
  require("mod-compatibilities."..modName..".data-updates")
end
