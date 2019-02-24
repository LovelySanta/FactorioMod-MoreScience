local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local grayPackName = "military-science-pack"
local grayTechName = "military-science-research"

----- TEMPORARY PLACEHOLDER TECHNOLOGY  ------------
data:extend{
  {
    type = "technology",
    name = grayTechName,
    unit =
    {
      count = 30,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
      },
      time = 5,
    },
    upgrade = false,
    order = "c-a",
  },
} -----------------------------------------------------

--------------------------------------------------------------------------------
----- gray science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(grayTechName, scienceResearch.icon .. "potion-gray.png", scienceResearch.icon_size)

-- prerequisites this technology depend on
MoreScience.lib.technology.addPrerequisite(grayTechName, "military-2")
MoreScience.lib.technology.addPrerequisite(grayTechName, "stone-walls")

for _,recipeName in pairs{
  grayPackName.."-fluid",
  grayPackName,
} do
  MoreScience.lib.technology.addRecipeUnlock(grayTechName, recipeName)
end

--------------------------------------------------------------------------------
----- other gray science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "military-3",
  "landmines",
  "laser-turrets",
  "rocketry",
  "grenade-damage-1",
  "combat-robotics",
} do
  MoreScience.lib.technology.addPrerequisite(techName, grayTechName)
end
