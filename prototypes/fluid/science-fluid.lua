
local function createScienceFluid(fluidName, order, fluidNumber, baseColor, flowColor)
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
      subgroup = "science-fluid",
      order = "z-MoreScience-" .. order .. "[" .. fluidName .. "]"
    },
  })
end

-- purified water
createScienceFluid("purified-water", "a", 0, {r=155, g=255, b=246}, {r=155, g=255, b=246})
data.raw["fluid"]["purified-water"].subgroup = "science-raw-material"

-- basic science fluid 1
createScienceFluid("basic-science-fluid-1", "b1", 14, {r=191, g=19, b=19}, {r=200, g=48, b=48})
-- basic science fluid 2
createScienceFluid("basic-science-fluid-2", "c1", 3, {r=63, g=187, b=63}, {r=63, g=187, b=63})
-- basic science fluid 3
createScienceFluid("basic-science-fluid-3", "d1", 8, {r=12, g=70, b=206}, {r=0, g=12, b=255})

-- advanced science fluid 1
createScienceFluid("advanced-science-fluid-1", "e1", 10, {r=159, g=27, b=247}, {r=159, g=27, b=247})
-- advanced science fluid 2
createScienceFluid("advanced-science-fluid-2", "e3", 2, {r=255, g=193, b=0}, {r=255, g=193, b=0})

-- extreme science fluid
createScienceFluid("extreme-science-fluid", "f", 1, {r=200, g=200, b=200}, {r=200, g=200, b=200})

-- basic military science fluid
createScienceFluid("basic-military-science-fluid", "c2", 9, {r=68, g=43, b=5}, {r=68, g=43, b=5})
-- automation science fluid
createScienceFluid("basic-automation-science-fluid", "c3", 15, {r=255, g=121, b=5}, {r=234, g=132, b=0})
-- power science fluid
createScienceFluid("basic-power-science-fluid", "d2", 5, {r=0, g=198, b=198}, {r=0, g=239, b=207})
-- logistics science fluid
createScienceFluid("basic-logistics-science-fluid", "e2", 13, {r=255, g=68, b=235}, {r=255, g=68, b=235})
