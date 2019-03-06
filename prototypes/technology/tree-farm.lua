local scienceNames = require("prototypes/settings").scienceNames

local woodPlantation = util.table.deepcopy(data.raw["technology"]["automation-2"])
woodPlantation.name = "wood-plantation"
woodPlantation.icon = "__MoreScience__/graphics/technology/wood-plantation-tech.png"
woodPlantation.icon_size = 128
woodPlantation.prerequisites =
{
  "landfill",
  string.format(scienceNames.orange, "pack"),
  string.format(scienceNames.cyan  , "pack"),
}
woodPlantation.effects =
{
  {
    type = "unlock-recipe",
    recipe = "hand-saw",
  },
  {
    type = "unlock-recipe",
    recipe = "seed-extractor",
  },
  {
    type = "unlock-recipe",
    recipe = "tree-seed-creator",
  },
  {
    type = "unlock-recipe",
    recipe = "tree-seed",
  },
  {
    type = "unlock-recipe",
    recipe = "wood-plantation",
  },
  {
    type = "unlock-recipe",
    recipe = "organic-tree",
  },
  {
    type = "unlock-recipe",
    recipe = "wood-creator",
  }
}
woodPlantation.unit =
{
  count = 3 * data.raw["technology"]["battery"].unit.count,
  ingredients = util.table.deepcopy(data.raw["technology"]["battery"].unit.ingredients),
  time = 2 * data.raw["technology"]["battery"].unit.time,
}

data:extend({
  woodPlantation,
})
