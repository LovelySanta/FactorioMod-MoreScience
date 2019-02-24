
--------------------------------------------------------------------------------
----- red science pack basic (manual craftable)                            -----
--------------------------------------------------------------------------------
local earlySciencePack = util.table.deepcopy(data.raw["recipe"]["science-pack-1"])
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

local orangePackName = "ms-science-pack-1"
MoreScience.lib.recipe.create       (orangePackName)
MoreScience.lib.recipe.addIngredient(orangePackName, "small-lamp"          , 02 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "assembling-machine-1", 01 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "concrete"            , 10 ,"item")
MoreScience.lib.recipe.addResult    (orangePackName, orangePackName        , 01, "item")



--------------------------------------------------------------------------------
----- organise all science pack recipes                                    -----
--------------------------------------------------------------------------------
for sciencePackName,craftingTime in pairs{
  ["science-pack-1"               ] = 2.5,
  ["science-pack-2"               ] = 3,
  ["military-science-pack"        ] = 5,
  [orangePackName                 ] = 5,
  ["science-pack-3"               ] = 10,
  --["basic-power-science-pack"     ] = 10,
  ["production-science-pack"      ] = 20,
  --["basic-logistics-science-pack" ] = 20,
  ["high-tech-science-pack"       ] = 30,
  --["space-science-pack"           ] = 50,
} do
  MoreScience.lib.recipe.disable            (sciencePackName)
  MoreScience.lib.recipe.setCraftingCategory(sciencePackName, "ms-advanced-crafting")
  MoreScience.lib.recipe.setShowMadeIn      (sciencePackName, true)
  MoreScience.lib.recipe.setEngergyRequired (sciencePackName, craftingTime)

  MoreScience.lib.recipe.addIngredient      (sciencePackName, "empty-bottle"    , 1 , "item")
  MoreScience.lib.recipe.addIngredient      (sciencePackName, "ms-science-fluid", 1, "fluid")
end

-- TEMPORARY REMOVE IT AGAIN
for sciencePackName,craftingTime in pairs{
  --["science-pack-1"               ] = 2.5,
  --["science-pack-2"               ] = 3,
  --["military-science-pack"        ] = 5,
  --[orangePackName                 ] = 5,
  ["science-pack-3"               ] = 10,
  --["basic-power-science-pack"     ] = 10,
  ["production-science-pack"      ] = 20,
  --["basic-logistics-science-pack" ] = 20,
  ["high-tech-science-pack"       ] = 30,
  --["space-science-pack"           ] = 50,
} do
  MoreScience.lib.recipe.removeIngredient(sciencePackName, "ms-science-fluid")
end
