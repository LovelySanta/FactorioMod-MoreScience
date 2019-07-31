local scienceNames = require("prototypes/settings").scienceNames

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "technology",
    name = string.format(scienceNames.mixing, "pack"),
    localised_name = data.raw["item"][string.format(scienceNames.mixing, "pack")].localised_name,
    icon = "__MoreScience__/graphics/technology/cauldron-tech.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "science-cauldron",
      },
      {
        type = "unlock-recipe",
        recipe = string.format(scienceNames.mixing, "fluid-intermediate1"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(scienceNames.mixing, "fluid-intermediate2"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(scienceNames.mixing, "fluid-intermediate3"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(scienceNames.mixing, "fluid"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(scienceNames.mixing, "pack"),
      }
    },
    prerequisites = {
      string.format(scienceNames.pink, "pack"),
    },
    unit =
    {
      count = data.raw["technology"]["rocket-silo"].unit.count / 2,
      ingredients = data.raw["technology"]["rocket-silo"].unit.ingredients,
      time = data.raw["technology"]["rocket-silo"].unit.time,
    },
    order = data.raw["technology"]["rocket-silo"].order
  }}
  
end
