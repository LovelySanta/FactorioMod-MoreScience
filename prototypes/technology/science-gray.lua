local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local grayScienceName = scienceNames.gray

--------------------------------------------------------------------------------
----- gray science research                                               -----
--------------------------------------------------------------------------------
MoreScience.lib.technology.changeIcon(string.format(grayScienceName, "pack"), scienceTech.icon .. "potion-gray.png", scienceTech.icon_size)

MoreScience.lib.technology.addRecipeUnlock(string.format(grayScienceName, "pack"), string.format(grayScienceName, "fluid"))
MoreScience.lib.technology.moveRecipeUnlock(string.format(grayScienceName, "pack"), string.format(grayScienceName, "pack"), string.format(grayScienceName, "pack")) -- this is just for unlock ordening


--------------------------------------------------------------------------------
----- other gray science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "modular-armor",
  "flight"       ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, string.format(grayScienceName, "pack"))
end

-- add tech ingredient to other science packs
for techName,techLevels in pairs{
  ["modular-armor"      ] = {},
  ["flight"             ] = {},
  ["roboports"          ] = {},
  ["power-armor"        ] = {},
  ["rocket-control-unit"] = {},
  ["rocket-silo"        ] = {},
} do
  if MoreScience.lib.table.isEmpty(techLevels) then
    MoreScience.lib.technology.addIngredient(techName, 1, string.format(grayScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      MoreScience.lib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(grayScienceName, "pack"))

    end
  end
end
