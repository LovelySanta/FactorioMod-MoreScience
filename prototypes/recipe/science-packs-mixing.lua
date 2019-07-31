local scienceNames   = require("prototypes/settings").scienceNames
local rocketCauldron = require("prototypes/settings").rocketCauldron
local fluidsPerPack  = require("prototypes/settings").fluidsPerPack

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{
    {
      type = "recipe",
      name = string.format(scienceNames.mixing, "pack"),
      energy_required = 3,
      category = "ms-chemical-crafting",
      ingredients =
      {
        {type = "item" , name = "empty-bottle", amount = 1},
        {type = "fluid", name = string.format(scienceNames.mixing, "fluid"), amount = 9},
        fluidsPerPack - 9 > 0 and {type = "fluid", name = "purified-water" , amount = fluidsPerPack - 9} or nil,
      },
      results =
      {
        {string.format(scienceNames.mixing, "pack"), 1},
      },
      enabled = false,
    }
  }

end
