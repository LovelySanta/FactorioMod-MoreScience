local scienceTech      = require("prototypes/settings").techIcons
local scienceNames     = require("prototypes/settings").scienceNames
local greenScienceName = scienceNames.green

--------------------------------------------------------------------------------
----- green science research                                               -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(greenScienceName, "pack"), scienceTech.icon .. "potion-green.png", scienceTech.icon_size)

-- prerequisites this technology depend on
LSlib.technology.addPrerequisite(string.format(greenScienceName, "pack"), "bottling-research")

LSlib.technology.addRecipeUnlock(string.format(greenScienceName, "pack"), string.format(greenScienceName, "fluid"))
LSlib.technology.moveRecipeUnlock(string.format(greenScienceName, "pack"), string.format(greenScienceName, "pack"), string.format(greenScienceName, "pack")) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other green science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-2",
} do
  LSlib.technology.addPrerequisite(techName, string.format(greenScienceName, "pack"))
end

--------------------------------------------------------------------------------
----- Tools                                                                -----
--------------------------------------------------------------------------------
LSlib.technology.addPrerequisite("steel-axe", "toolbelt")
LSlib.technology.addIngredient("steel-axe", 1, string.format(scienceNames.green, "pack"))
LSlib.technology.changeCount("steel-axe", 100)

LSlib.technology.addPrerequisite("railway", "automobilism")
