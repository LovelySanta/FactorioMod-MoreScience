local scienceTech     = require("prototypes/settings").techIcons
local scienceNames    = require("prototypes/settings").scienceNames
local grayScienceName = scienceNames.gray

--------------------------------------------------------------------------------
----- gray science research                                               -----
--------------------------------------------------------------------------------
LSlib.technology.changeIcon(string.format(grayScienceName, "pack"), scienceTech.icon .. "potion-gray.png", scienceTech.icon_size)

LSlib.technology.addRecipeUnlock(string.format(grayScienceName, "pack"), string.format(grayScienceName, "fluid"))
LSlib.technology.moveRecipeUnlock(string.format(grayScienceName, "pack"), string.format(grayScienceName, "pack"), string.format(grayScienceName, "pack")) -- this is just for unlock ordening


--------------------------------------------------------------------------------
----- other gray science technologies                                       -----
--------------------------------------------------------------------------------

-- other technologies that depend on this one
for _,techName in pairs{
  "modular-armor",
  "flight"       ,
} do
  LSlib.technology.addPrerequisite(techName, string.format(grayScienceName, "pack"))
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
  if LSlib.utils.table.isEmpty(techLevels) then
    LSlib.technology.addIngredient(techName, 1, string.format(grayScienceName, "pack"))
  else
    for _,techLevel in pairs(techLevels) do
      LSlib.technology.addIngredient(string.format(techName, techLevel), 1, string.format(grayScienceName, "pack"))

    end
  end
end
