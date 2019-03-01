local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128
local grayPackName = "military-science-pack"
local grayTechName = grayPackName

--------------------------------------------------------------------------------
----- gray science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(grayTechName, scienceResearch.icon .. "potion-gray.png", scienceResearch.icon_size)

MoreScience.lib.technology.addRecipeUnlock(grayTechName, grayPackName.."-fluid")
MoreScience.lib.technology.moveRecipeUnlock(grayTechName, grayTechName, grayPackName) -- this is just for unlock ordening


--------------------------------------------------------------------------------
----- other gray science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "flight",
} do
  MoreScience.lib.technology.addPrerequisite(techName, grayTechName)
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  -- Oil related stuff
  ["flight"] = {},
} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, grayPackName)
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, grayPackName)

    end
  end
end
