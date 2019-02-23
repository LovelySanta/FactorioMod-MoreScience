local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local greenTechName = "basic-science-research-1"

----- TEMPORARY PLACEHOLDER TECHNOLOGY  ------------
data:extend{
  {
    type = "technology",
    name = greenTechName,
    unit =
    {
      count = 30,
      ingredients =
      {
        {"science-pack-1", 2},
      },
      time = 5,
    },
    upgrade = false,
    order = "c-a",
  },
} -----------------------------------------------------

--------------------------------------------------------------------------------
----- green science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(greenTechName, scienceResearch.icon .. "potion-green.png", scienceResearch.icon_size)

-- prerequisites this technology depend on
MoreScience.lib.technology.addPrerequisite(greenTechName, "bottling-research")

for _,recipeName in pairs{
  "science-pack-2-fluid",
  "science-pack-2",
} do
  MoreScience.lib.technology.addRecipeUnlock(greenTechName, recipeName)
end

--------------------------------------------------------------------------------
----- other green science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "landfill",
  "toolbelt",
  "research-speed-2",
  "electric-energy-distribution-1",
  "military-2",
} do
  MoreScience.lib.technology.addPrerequisite(techName, greenTechName)
end
