local scienceNames = require("prototypes/settings").scienceNames
local rocketParts  = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- space-science-packs                                                  -----
--------------------------------------------------------------------------------
data:extend{
  {
    type = "recipe",
    name = string.format(rocketParts.payload, "mk1", "empty-bottle"),
    energy_required = 300,
    category = "ms-advanced-crafting",
    ingredients =
    {
      util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product),
      {string.format(rocketParts.container, "mk1"), 1},
    },
    result = string.format(rocketParts.payload, "mk1", "empty-bottle"),
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
      {string.format(rocketParts.payload, "mk1", string.format(scienceNames.white, "pack")), 1}
    },
    results = {
      util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product),
      {string.format(rocketParts.container, "mk1"), 1},
    },
    main_product = string.format(scienceNames.white, "pack"),
    enabled = false,
  },
}
LSlib.recipe.editIngredient(string.format(rocketParts.payload, "mk1", "empty-bottle"), string.format(scienceNames.white, "pack"), "empty-bottle", 1)
data.raw["item"]["satellite"].rocket_launch_product = data.raw["recipe"][string.format(scienceNames.white, "pack")].ingredients[1]
LSlib.recipe.addIngredient("satellite", string.format(rocketParts.payload, "mk1", "empty-bottle"), 1, "item")
