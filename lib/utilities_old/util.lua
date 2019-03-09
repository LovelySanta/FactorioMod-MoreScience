if not MoreScience.lib.util then MoreScience.lib.util = {}

  function MoreScience.lib.util.stringSplit(inputstring, sep)
    if sep == nil then
      sep = "%s"
    end
    local t = {}
    local i = 1
    for str in string.gmatch(inputstring, "([^" .. sep .. "]+)") do
      t[i] = str
      i = i + 1
    end
    return t
  end

  function MoreScience.lib.util.convertRGB(color)
    for key,_ in pairs(color) do
      color[key] = color[key] / 255
    end
    return color
  end

end
