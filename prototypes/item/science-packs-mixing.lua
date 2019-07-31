local scienceNames   = require("prototypes/settings").scienceNames
local rocketCauldron = require("prototypes/settings").rocketCauldron

-- bottle to put into the crate
if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "item",
    name = string.format(scienceNames.mixing, "pack"),
    localised_name = {"item-name."..string.format(scienceNames.mixing, "pack"), {"item-name.rainbow-modifier"}},
    icons =
    {
      {
        icon = "__MoreScience__/graphics/icons/potion/set-01/potion-99.png",
        icon_size = 32,
      },
      {
        icon = "__MoreScience__/graphics/icons/potion/cork.png",
        icon_size = 32,
      },
    },
    subgroup = "ms-science-" .. rocketCauldron.subgroup,
    order = "a[" .. rocketCauldron.subgroup .. "]-b-c",
    stack_size = 100,
  }}

end
