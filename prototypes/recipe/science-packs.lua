
--------------------------------------------------------------------------------
----- red science pack basic (manual craftable)                            -----
--------------------------------------------------------------------------------
local earlySciencePack = util.table.deepcopy(data.raw["recipe"]["automation-science-pack"])
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

local orangePackName = "advanced-automation-science-pack"
MoreScience.lib.recipe.create       (orangePackName)
MoreScience.lib.recipe.addIngredient(orangePackName, "fast-inserter"       , 02 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "assembling-machine-1", 01 ,"item")
MoreScience.lib.recipe.addIngredient(orangePackName, "concrete"            , 20 ,"item")
MoreScience.lib.recipe.addResult    (orangePackName, orangePackName        , 01, "item")



--------------------------------------------------------------------------------
----- cyan science pack                                                    -----
--------------------------------------------------------------------------------

local cyanPackName = "electric-power-science-pack"
MoreScience.lib.recipe.create       (cyanPackName)
MoreScience.lib.recipe.addIngredient(cyanPackName, "small-lamp"          , 03 ,"item")
MoreScience.lib.recipe.addIngredient(cyanPackName, "medium-electric-pole", 01 ,"item")
MoreScience.lib.recipe.addIngredient(cyanPackName, "solar-panel"         , 01 ,"item")
MoreScience.lib.recipe.addResult    (cyanPackName, cyanPackName          , 01, "item")


--------------------------------------------------------------------------------
----- organise all science pack recipes                                    -----
--------------------------------------------------------------------------------
for sciencePackName,craftingTime in pairs{
  ["automation-science-pack"      ] = 2.5,
  ["logistic-science-pack"        ] = 3,
  ["military-science-pack"        ] = 5,
  [orangePackName                 ] = 5,
  [cyanPackName                   ] = 10,
  ["chemical-science-pack"        ] = 10,
  ["production-science-pack"      ] = 20,
  --["basic-logistics-science-pack" ] = 20,
  ["utility-science-pack"         ] = 30,
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
  ["chemical-science-pack"        ] = 10,
  ["production-science-pack"      ] = 20,
  ["utility-science-pack"         ] = 30,
  --["space-science-pack"           ] = 50,
} do
  MoreScience.lib.recipe.removeIngredient(sciencePackName, "ms-science-fluid")
end
