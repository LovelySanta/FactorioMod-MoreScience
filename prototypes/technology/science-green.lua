local scienceTech      = require("prototypes/settings").techIcons
local scienceNames     = require("prototypes/settings").scienceNames
local greenScienceName = scienceNames.green

--------------------------------------------------------------------------------
----- green science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(greenScienceName, "pack"), scienceTech.icon .. "potion-green.png", scienceTech.icon_size)

-- prerequisites this technology depend on
MoreScience.lib.technology.addPrerequisite(string.format(greenScienceName, "pack"), "bottling-research")

MoreScience.lib.technology.addRecipeUnlock(string.format(greenScienceName, "pack"), string.format(greenScienceName, "fluid"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(greenScienceName, "pack"), string.format(greenScienceName, "pack"), string.format(greenScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other green science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-2",
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(greenScienceName, "pack"))
end

--------------------------------------------------------------------------------
----- Tools                                                                -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.addPrerequisite("steel-axe", "toolbelt")
MoreScience.lib.technology.addIngredient("steel-axe", 1, string.format(scienceNames.green, "pack"))
MoreScience.lib.technology.changeCount("steel-axe", 100)

MoreScience.lib.technology.addPrerequisite("railway", "automobilism")
