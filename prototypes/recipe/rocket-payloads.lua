local scienceNames   = require("prototypes/settings").scienceNames
local rocketParts    = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- space-science-packs from science experiment                          -----
--------------------------------------------------------------------------------
data:extend{{
  type = "recipe",
  name = string.format(scienceNames.white, "pack"),
  energy_required = 300,
  category = "ms-advanced-crafting",
  ingredients =
  {
    {string.format(rocketParts.payload, "mk1", string.format(scienceNames.white, "pack")), 1}
  },
  results =
  {
    util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product),
    {string.format(rocketParts.container, "mk1"), 1},
  },
  main_product = string.format(scienceNames.white, "pack"),
  enabled = false,
}}

if settings.startup["MS-rocket-launching-extended"].value == true then
  data:extend{{
    type = "recipe",
    name = string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
    energy_required = 300,
    category = "ms-advanced-crafting",
    ingredients =
    {
      util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_product),
      {string.format(rocketParts.container, "mk1"), 1},
    },
    result = string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
    result_count = 1,
    enabled = false,
  }}

  log(serpent.block(data.raw.recipe[string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack"))]))
  LSlib.recipe.editIngredient(string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")), string.format(scienceNames.white , "pack"), string.format(scienceNames.mixing, "pack"), 1)
  LSlib.recipe.addIngredient("satellite", string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")), 1, "item")
else
  data:extend{{
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
  }}

  LSlib.recipe.editIngredient(string.format(rocketParts.payload, "mk1", "empty-bottle"), string.format(scienceNames.white, "pack"), "empty-bottle", 1)
  LSlib.recipe.addIngredient("satellite", string.format(rocketParts.payload, "mk1", "empty-bottle"), 1, "item")
end

data.raw["item"]["satellite"].rocket_launch_product = data.raw["recipe"][string.format(scienceNames.white, "pack")].ingredients[1]
