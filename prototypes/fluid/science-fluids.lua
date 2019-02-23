
function createScienceFluid(fluidName, order, fluidNumber, baseColor, flowColor)
  local function numberToString(number)
    --if number >= 10 then return "" .. number else return "0" .. number end
    return ((number >= 10) and ("" .. number) or ("0" .. number))
  end

  data:extend({
    {
      type = "fluid",
      name = fluidName,
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
      order = "z-MoreScience-" .. order .. "[" .. fluidName .. "]"
    },
  })
end



-- purified water
createScienceFluid("purified-water", "a", 0, {r=155, g=255, b=246}, {r=155, g=255, b=246})
data.raw["fluid"]["purified-water"].subgroup = "ms-science-raw-material"
