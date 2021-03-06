
--------------------------------------------------------------------------------
----- hand-saw                                                             -----
--------------------------------------------------------------------------------
local handSaw =
{
  type = "recipe",
  name = "hand-saw",
  energy_required = 2,
  enabled = false,
  ingredients =
  {
    {"iron-plate", 2},
    {"iron-stick", 1},
    {"wood", 1},
  },
  result = "hand-saw",
}



--------------------------------------------------------------------------------
----- seed-extractor                                                       -----
--------------------------------------------------------------------------------
local seedExtractor =
{
  type = "recipe",
  name = "seed-extractor",
  energy_required = data.raw["assembling-machine"]["chemical-plant"].energy_required,
  enabled = false,
  ingredients =
  {
    {"chemical-plant", 1},
    {handSaw.name, 1},
    {"wood", data.raw["item"]["wood"].stack_size / 2},
  },
  result = "seed-extractor",
}



--------------------------------------------------------------------------------
----- wood-plantation                                                      -----
--------------------------------------------------------------------------------
local woodPlantation  =
{
  type = "recipe",
  name = "wood-plantation",
  energy_required = seedExtractor.energy_required,
  enabled = false,
  ingredients = {
    {"assembling-machine-2", 1},
    {"sand", data.raw["item"]["sand"].stack_size},
    {"landfill", data.raw["item"]["sand"].stack_size},
    {"wood", data.raw["item"]["wood"].stack_size},
    {handSaw.name, data.raw["item"]["hand-saw"].stack_size},
  },
  result = "wood-plantation",
}



--------------------------------------------------------------------------------
----- tree                                                                 -----
--------------------------------------------------------------------------------
local organicTree =
{
  type = "recipe",
  name = "organic-tree",
  energy_required = 60 * 5,
  enabled = false,
  category = "ms-wood-plantation",
  ingredients =
  {
    {"tree-seed", 1},
  },
  result = "organic-tree",
}



--------------------------------------------------------------------------------
----- tree-seed                                                            -----
--------------------------------------------------------------------------------
local treeSeed =
{
  type = "recipe",
  name = "tree-seed",
  localised_name = util.table.deepcopy(data.raw["item"]["tree-seed"].localised_name),
  energy_required = 60,
  enabled = false,
  category = "ms-seed-extractor",
  ingredients = {
    {organicTree.result, 1},
  },
  result = "tree-seed",
  result_count = 5,
}



local treeSeedCreator =
{
  type = "recipe",
  name = treeSeed.name .. "-creator",
  localised_name = util.table.deepcopy(data.raw["item"][treeSeed.name].localised_name),
  icon = data.raw["item"][treeSeed.name].icon,
  icon_size = data.raw["item"][treeSeed.name].icon_size,
  subgroup = data.raw["item"][treeSeed.name].subgroup,
  energy_required = treeSeed.energy_required / 2,
  enabled = treeSeed.enabled,
  category = treeSeed.category,
  ingredients = {
    {"wood", 100},
    {"sand", 10},
  },
  results =
  {
    {type="item", name="sand", amount = 5},
    {type="item", name=treeSeed.result, amount = 1, probability = .025},
  },
  main_product = treeSeed.result,
}



--------------------------------------------------------------------------------
----- tree-seed                                                            -----
--------------------------------------------------------------------------------
local rawWoodProduction =
{
  type = "recipe",
  name = "wood-creator",
  localised_name = {"item-name.wood"},
  energy_required = organicTree.energy_required / 2,
  enabled = false,
  category = "advanced-crafting",
  ingredients = {
    {organicTree.result, 1},
    {handSaw.name, 1},
  },
  result = "wood",
  result_count = 50
}


data:extend{
  handSaw,

  seedExtractor,
  treeSeedCreator,
  treeSeed,

  woodPlantation,
  organicTree,

  rawWoodProduction,
}
