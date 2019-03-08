local scienceNames  = require("prototypes/settings").scienceNames
local fluidsPerPack = require("prototypes/settings").fluidsPerPack

--------------------------------------------------------------------------------
----- red science pack basic (manual craftable)                            -----
--------------------------------------------------------------------------------
local earlySciencePack = util.table.deepcopy(data.raw["recipe"][string.format(scienceNames.red, "pack")])
earlySciencePack.name = earlySciencePack.name .. "-basic"
earlySciencePack.energy_required = 1
earlySciencePack.category = "ms-manual-crafting"
earlySciencePack.enabled = true

earlySciencePack.allow_as_intermediate = false
earlySciencePack.always_show_made_in = true

earlySciencePack.subgroup = "ms-science-bottling"
earlySciencePack.order = "e[science-pack-1]"
data:extend{earlySciencePack}



--------------------------------------------------------------------------------
----- orange science pack                                                  -----
--------------------------------------------------------------------------------

local orangePackName = string.format(scienceNames.orange, "pack")
MoreScience.lib.recipe.create       (orangePackName)
MoreScience.lib.recipe.addIngredient(orangePackName, "fast-inserter"       , 02 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "assembling-machine-1", 01 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "concrete"            , 20 ,"item")
MoreScience.lib.recipe.addResult    (orangePackName, orangePackName        , 01, "item")



--------------------------------------------------------------------------------
----- cyan science pack                                                    -----
--------------------------------------------------------------------------------

local cyanPackName = string.format(scienceNames.cyan, "pack")
MoreScience.lib.recipe.create       (cyanPackName)
MoreScience.lib.recipe.addIngredient(cyanPackName, "small-lamp"          , 03 ,"item")
MoreScience.lib.recipe.addIngredient(cyanPackName, "medium-electric-pole", 01 ,"item")
MoreScience.lib.recipe.addIngredient(cyanPackName, "solar-panel"         , 01 ,"item")
MoreScience.lib.recipe.addResult    (cyanPackName, cyanPackName          , 01, "item")



--------------------------------------------------------------------------------
----- pink science pack                                                   -----
--------------------------------------------------------------------------------

local pinkPackName = string.format(scienceNames.pink, "pack")
MoreScience.lib.recipe.create       (pinkPackName)
MoreScience.lib.recipe.addIngredient(pinkPackName, "rocket-control-unit", 01 ,"item")
MoreScience.lib.recipe.addIngredient(pinkPackName, "effectivity-module" , 02 ,"item")
MoreScience.lib.recipe.addIngredient(pinkPackName, "nuclear-fuel"       , 01 ,"item")
MoreScience.lib.recipe.addResult    (pinkPackName, pinkPackName         , 01, "item")



--------------------------------------------------------------------------------
----- organise all regular science pack recipes                            -----
--------------------------------------------------------------------------------
for sciencePackName,craftingTime in pairs{
  [string.format(scienceNames.red   , "pack")] = 2.5,
  [string.format(scienceNames.green , "pack")] = 3,
  [string.format(scienceNames.gray  , "pack")] = 5,
  [orangePackName                            ] = 5,
  [cyanPackName                              ] = 10,
  [string.format(scienceNames.blue  , "pack")] = 10,
  [string.format(scienceNames.purple, "pack")] = 20,
  [string.format(scienceNames.yellow, "pack")] = 20,
  [pinkPackName                              ] = 30,
  --[string.format(scienceNames.white , "pack")] = 50,
} do
  if data.raw.recipe[sciencePackName] then
    MoreScience.lib.recipe.disable            (sciencePackName)
    MoreScience.lib.recipe.setCraftingCategory(sciencePackName, "ms-advanced-crafting")
    MoreScience.lib.recipe.setShowMadeIn      (sciencePackName, true)
    MoreScience.lib.recipe.setEngergyRequired (sciencePackName, craftingTime)

    MoreScience.lib.recipe.addIngredient      (sciencePackName, "empty-bottle"    , 1 , "item")
    MoreScience.lib.recipe.addIngredient      (sciencePackName, "ms-science-fluid", 1, "fluid")
  end
end

for sciencePackName,craftingTime in pairs{
  [string.format(scienceNames.red   , "pack")] = 2.5,
  [string.format(scienceNames.green , "pack")] = 3,
  [string.format(scienceNames.gray  , "pack")] = 5,
  --[orangePackName                            ] = 5,
  --[cyanPackName                              ] = 10,
  [string.format(scienceNames.blue  , "pack")] = 10,
  [string.format(scienceNames.purple, "pack")] = 20,
  [string.format(scienceNames.yellow, "pack")] = 20,
  --[pinkPackName                              ] = 30,
  --[string.format(scienceNames.white , "pack")] = 50,
} do
  if data.raw.recipe[sciencePackName] then
    MoreScience.lib.module.removeModuleFromRecipe({
      "productivity-module"  ,
      "productivity-module-2",
      "productivity-module-3",
    }, sciencePackName)
  end
end

--------------------------------------------------------------------------------
----- infused-science-packs                                                -----
--------------------------------------------------------------------------------
for scienceColor,scienceName in pairs(scienceNames) do
  local regularPack = data.raw["recipe"][string.format(scienceName, "pack")]

  data:extend{{
    type = "recipe",
    name = "infused-"..string.format(scienceName, "pack"),
    energy_required = 2 * (regularPack and regularPack.energy_required or 50),
    enabled = false,
    category = "ms-chemical-crafting",
    ingredients =
    {
      {string.format(scienceName, "pack"), 2},
      {type = "fluid", name = string.format(scienceNames.white, "fluid"), amount = fluidsPerPack},
      {type = "fluid", name = "purified-water"                          , amount = fluidsPerPack},
    },
    result = "infused-"..string.format(scienceName, "pack"),
  }}

  MoreScience.lib.module.allowModuleOnRecipe({
    "productivity-module"  ,
    "productivity-module-2",
    "productivity-module-3",
  }, "infused-"..string.format(scienceName, "pack"))
end
