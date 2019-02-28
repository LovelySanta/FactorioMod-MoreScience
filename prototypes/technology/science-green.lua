local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local greenPackName = "logistic-science-pack"
local greenTechName = greenPackName

--------------------------------------------------------------------------------
----- green science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(greenTechName, scienceResearch.icon .. "potion-green.png", scienceResearch.icon_size)

-- prerequisites this technology depend on
MoreScience.lib.technology.addPrerequisite(greenTechName, "bottling-research")

MoreScience.lib.technology.addRecipeUnlock(greenTechName, greenPackName.."-fluid")
MoreScience.lib.technology.moveRecipeUnlock(greenTechName, greenTechName, greenPackName) -- this is just for unlock ordening

--------------------------------------------------------------------------------
----- other green science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "research-speed-2",
} do
  MoreScience.lib.technology.addPrerequisite(techName, greenTechName)
end

--------------------------------------------------------------------------------
----- Tools                                                                -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.addPrerequisite("steel-axe", "toolbelt")
MoreScience.lib.technology.addIngredient("steel-axe", 1, "logistic-science-pack")
MoreScience.lib.technology.changeCount("steel-axe", 100)

MoreScience.lib.technology.addPrerequisite("railway", "automobilism")
