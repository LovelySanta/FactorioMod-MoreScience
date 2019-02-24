
function createScienceFluid(packName, fluidName, order, fluidNumber, baseColor, flowColor)
  local function numberToString(number)
    --if number >= 10 then return "" .. number else return "0" .. number end
    return ((number >= 10) and ("" .. number) or ("0" .. number))
  end

  data:extend({
    {
      type = "fluid",
      name = packName .. fluidName,
      localised_name = {"fluid-name.science-fluid", {"item-name." .. packName}},
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
      order = "z-MoreScience-" .. order .. "[" .. packName .. fluidName .. "]"
    },
  })
end



-- purified water
createScienceFluid("purified-water", "", "a", 0, {r=155, g=255, b=246}, {r=155, g=255, b=246})
MoreScience.lib.item.setLocalisedName("fluid", "purified-water", nil                      )
MoreScience.lib.item.setSubgroup     ("fluid", "purified-water", "ms-science-raw-material")

-- science fluids
createScienceFluid("science-pack-1"       , "-fluid", "b1", 14, {r=191, g=019, b=019}, {r=200, g=048, b=048})
createScienceFluid("science-pack-2"       , "-fluid", "c1", 03, {r=063, g=187, b=063}, {r=063, g=187, b=063})
createScienceFluid("military-science-pack", "-fluid", "c2", 09, {r=068, g=043, b=005}, {r=068, g=043, b=005})
createScienceFluid("ms-science-pack-1"    , "-fluid", "c3", 15, {r=255, g=121, b=005}, {r=234, g=132, b=000})
