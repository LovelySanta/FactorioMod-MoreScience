local scienceNames   = require("prototypes/settings").scienceNames
local rocketCauldron = require("prototypes/settings").rocketCauldron

--------------------------------------------------------------------------------
----- space-science-packs from science experiment                          -----
--------------------------------------------------------------------------------
if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "fluid",
    name = string.format(scienceNames.mixing, "fluid"),
    localised_name = {"fluid-name.science-fluid", {"item-name.rainbow-modifier"}},
    icon = "__MoreScience__/graphics/icons/fluid/rainbow-fluid-0.png",
    icon_size = 32,

    base_color = data.raw.fluid[string.format(scienceNames.white, "fluid")].base_color,
    flow_color = data.raw.fluid[string.format(scienceNames.white, "fluid")].flow_color,

    default_temperature = 0,
    max_temperature = 0,
    heat_capacity = "0.1KJ",
    auto_barrel = false,

    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    -- fuel_value = "8MJ",
    subgroup = "ms-science-" .. rocketCauldron.subgroup,
    order = "a[" .. rocketCauldron.subgroup .. "]-b-b"
  }}

  local fluidColor = { "gray", "blue", "purple" }
  for fluidNumber = 1, 3 do
    data:extend{{
      type = "fluid",
      name = string.format(scienceNames.mixing, "fluid-intermediate"..fluidNumber),
      localised_name = {"fluid-name.rainbow-science-intermediate", data.raw.fluid[string.format(scienceNames.mixing, "fluid")].localised_name, tostring(fluidNumber)},
      icon = "__MoreScience__/graphics/icons/fluid/rainbow-fluid-" .. fluidNumber .. ".png",
      icon_size = 32,

      base_color = data.raw.fluid[string.format(scienceNames[fluidColor[fluidNumber]], "fluid")].base_color,
      flow_color = data.raw.fluid[string.format(scienceNames[fluidColor[fluidNumber]], "fluid")].flow_color,

      default_temperature = 0,
      max_temperature = 0,
      heat_capacity = "0.1KJ",
      auto_barrel = false,

      pressure_to_speed_ratio = 0.4,
      flow_to_energy_ratio = 0.59,
      -- fuel_value = "8MJ",
      subgroup = "ms-science-" .. rocketCauldron.subgroup,
      order = "a[" .. rocketCauldron.subgroup .. "]-b-a" .. fluidNumber .. "[intermediates]"
    }}
  end

end
