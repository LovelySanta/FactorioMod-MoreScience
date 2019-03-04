local scienceNames = require("prototypes/settings").scienceNames
local rocketParts  = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- space-science-packs                                                  -----
--------------------------------------------------------------------------------
data:extend{
  {
    type = "recipe",
    name = string.format(rocketParts.payload, "mk1", "empty"),
    energy_required = 300,
    category = "ms-advanced-crafting",
    ingredients =
    {
      util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product),
    },
    result = string.format(rocketParts.payload, "mk1", "empty"),
    result_count = 1,
    enabled = false,
  },
  {
    type = "recipe",
    name = string.format(scienceNames.white, "pack"),
    energy_required = 300,
    category = "ms-advanced-crafting",
    ingredients =
    {
      {string.format(rocketParts.payload, "mk1", "full"), 1}
    },
    results = {
      util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product)
    },
    enabled = false,
  },
}
MoreScience.lib.recipe.editIngredient(string.format(rocketParts.payload, "mk1", "empty"), string.format(scienceNames.white, "pack"), "empty-bottle", 1)
data.raw["item"]["satellite"].rocket_launch_product = data.raw["recipe"][string.format(scienceNames.white, "pack")].ingredients[1]
MoreScience.lib.recipe.addIngredient("satellite", string.format(rocketParts.payload, "mk1", "empty"), 1, "item")
