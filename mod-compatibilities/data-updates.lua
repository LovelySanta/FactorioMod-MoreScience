
for _, modName in pairs({
  "Clowns-Nuclear",
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
