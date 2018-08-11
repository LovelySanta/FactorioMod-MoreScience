
for _, modName in pairs({
  "CorpseFlare",
  "LandMover",
  "logicarts",
  "Lumberjack",
  "NuclearFuel",
  "qol_research",
  "Vehicle Wagon"
}) do
  require("mod-compatibilities."..modName..".data-updates")
end
