
function createScienceFluid(scienceName, order, fluidNumber, baseColor, flowColor)
  local function numberToString(number)
    --if number >= 10 then return "" .. number else return "0" .. number end
    return ((number >= 10) and ("" .. number) or ("0" .. number))
  end

  data:extend({
    {
      type = "fluid",
      name = string.format(scienceName, "fluid"),
      localised_name = {"fluid-name.science-fluid", {"item-name." .. string.format(scienceName, "pack")}},
      icon = "__MoreScience__/graphics/icons/fluid/fluid-" .. numberToString(fluidNumber) .. ".png",
      icon_size = 32,

      base_color = -- color used for barrel and indicators
      {
        r = (1. * baseColor.r) / 255,
        g = (1. * baseColor.g) / 255,
        b = (1. * baseColor.b) / 255,
      },
      flow_color = -- color used for pipe rendering
      {
        r = (1. * flowColor.r) / 255,
        g = (1. * flowColor.g) / 255,
        b = (1. * flowColor.b) / 255,
      },

      default_temperature = 0,
      max_temperature = 0,
      heat_capacity = "0.1KJ",

      pressure_to_speed_ratio = 0.4,
      flow_to_energy_ratio = 0.59,
      -- fuel_value = "8MJ",
      subgroup = "ms-science-fluid",
      order = "z-MoreScience-" .. order .. "[" .. string.format(scienceName, "fluid") .. "]"
    },
  })
end



-- purified water
createScienceFluid("purified-water"                , "a" , 00, {r=155, g=255, b=246}, {r=155, g=255, b=246})
MoreScience.lib.item.setLocalisedName("fluid", "purified-water", nil                      )
MoreScience.lib.item.setSubgroup     ("fluid", "purified-water", "ms-science-raw-material")

-- science fluids
local scienceNames = require("prototypes/settings").scienceNames
createScienceFluid(scienceNames.red   , "a1", 14, {r=191, g=019, b=019}, {r=200, g=048, b=048})

createScienceFluid(scienceNames.green , "b1", 03, {r=063, g=187, b=063}, {r=063, g=187, b=063})
createScienceFluid(scienceNames.gray  , "b2", 09, {r=068, g=043, b=005}, {r=068, g=043, b=005})

createScienceFluid(scienceNames.orange, "c1", 15, {r=255, g=121, b=005}, {r=234, g=132, b=000})
createScienceFluid(scienceNames.cyan  , "c2", 05, {r=000, g=198, b=198}, {r=000, g=239, b=207})
createScienceFluid(scienceNames.blue  , "c3", 08, {r=012, g=070, b=206}, {r=000, g=012, b=255})

createScienceFluid(scienceNames.purple, "d1", 10, {r=159, g=027, b=247}, {r=159, g=027, b=247})
createScienceFluid(scienceNames.yellow, "d2", 02, {r=255, g=193, b=000}, {r=255, g=193, b=000})

createScienceFluid(scienceNames.pink  , "e1", 13, {r=255, g=068, b=235}, {r=255, g=068, b=235})
createScienceFluid(scienceNames.white , "e2", 01, {r=200, g=200, b=200}, {r=200, g=200, b=200})
