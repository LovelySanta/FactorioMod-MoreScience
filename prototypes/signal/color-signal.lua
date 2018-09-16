
if settings.startup["MS-lamp-colors"].value then

  -- alter the lamp prototype
  data.raw.lamp["small-lamp"].glow_size = 25
  data.raw.lamp["small-lamp"].glow_color_intensity = .85
  data.raw.lamp["small-lamp"].glow_render_mode = "multiplicative" -- acts as mask

  data.raw.lamp["small-lamp"].light_when_colored.size = 0
  data.raw.lamp["small-lamp"].light_when_colored.intensity = 0

  data.raw.lamp["small-lamp"].signal_to_color_mapping =
  {
    {type = "virtual", name = "white"       , color = {r=255, g=255, b=255}},
    {type = "virtual", name = "light-grey"  , color = {r=180, g=180, b=180}},
    {type = "virtual", name = "grey"        , color = {r=105, g=105, b=105}},
    {type = "virtual", name = "black"       , color = {r=34 , g=34 , b=34 }},
    {type = "virtual", name = "dark-purple" , color = {r=130, g=0  , b=128}},
    {type = "virtual", name = "light-purple", color = {r=207, g=110, b=228}},
    {type = "virtual", name = "pink"        , color = {r=255, g=167, b=209}},
    {type = "virtual", name = "yellow"      , color = {r=229, g=217, b=0  }},
    {type = "virtual", name = "orange"      , color = {r=229, g=149, b=0  }},
    {type = "virtual", name = "red"         , color = {r=229, g=0  , b=0  }},
    {type = "virtual", name = "brown"       , color = {r=160, g=106, b=66 }},
    {type = "virtual", name = "blue"        , color = {r=0  , g=0  , b=234}},
    {type = "virtual", name = "light-blue"  , color = {r=0  , g=131, b=199}},
    {type = "virtual", name = "cyan"        , color = {r=0  , g=211, b=221}},
    {type = "virtual", name = "green"       , color = {r=2  , g=190, b=1  }},
    {type = "virtual", name = "light-green" , color = {r=148, g=224, b=68 }},
  }

  for lampOrder, lampColor in pairs(data.raw.lamp["small-lamp"].signal_to_color_mapping) do

    -- delete the vanilla one if it exists since we'll be overriding it anyway
    if data.raw["virtual-signal"]["signal-"..lampColor.name] then
      data.raw["virtual-signal"]["signal-"..lampColor.name] = nil
    end

    local signal =
    {
      type = "virtual-signal",
      name = "signal-"..lampColor.name,
      localised_name = {"signal-name.color-signal", {"color."..lampColor.name}},
      localised_description = {"signal-description.color-signal"},
      icons = {[1]={icon = "__base__/graphics/icons/signal/signal_grey.png", tint = {}}},
      icon_size = 32,
      subgroup = "virtual-signal-color",
      order = "d[colors]-"..lampOrder.."["..lampColor.name.."]"
    }


    for colorIndex, colorValue in pairs(lampColor.color) do
      signal.icons[1].tint[colorIndex] = colorValue / 255
      lampColor.color[colorIndex] = colorValue / 255
    end

    data:extend{signal}
    lampColor.name = "signal-"..lampColor.name
  end

end
