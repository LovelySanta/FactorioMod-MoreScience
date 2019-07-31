local scienceNames   = require("prototypes/settings").scienceNames
local rocketCauldron = require("prototypes/settings").rocketCauldron

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{
    {
      type = "recipe",
      name = string.format(scienceNames.mixing, "fluid-intermediate1"),
      energy_required = 3,
      category = rocketCauldron.category,
      ingredients =
      {
        {type = "fluid", name = string.format(scienceNames.red   , "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.blue  , "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.purple, "fluid"), amount = 1},
      },
      results =
      {
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate1"), amount = 3},
      },
      enabled = false,
    },
    {
      type = "recipe",
      name = string.format(scienceNames.mixing, "fluid-intermediate2"),
      energy_required = 3,
      category = rocketCauldron.category,
      ingredients =
      {
        {type = "fluid", name = string.format(scienceNames.green , "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.cyan  , "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.yellow, "fluid"), amount = 1},
      },
      results =
      {
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate2"), amount = 3},
      },
      enabled = false,
    },
    {
      type = "recipe",
      name = string.format(scienceNames.mixing, "fluid-intermediate3"),
      energy_required = 3,
      category = rocketCauldron.category,
      ingredients =
      {
        {type = "fluid", name = string.format(scienceNames.gray  , "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.orange, "fluid"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.pink  , "fluid"), amount = 1},
      },
      results =
      {
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate3"), amount = 3},
      },
      enabled = false,
    },
    {
      type = "recipe",
      name = string.format(scienceNames.mixing, "fluid"),
      energy_required = 1,
      category = rocketCauldron.category,
      always_show_made_in = true,
      ingredients =
      {
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate1"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate2"), amount = 1},
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid-intermediate3"), amount = 1},
      },
      results =
      {
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid"), amount = 3},
      },
      enabled = false,
    },
  }

end
