if not MoreScience.lib.item then MoreScience.lib.item = {}

  function MoreScience.lib.item.setHidden(itemType, itemName)
    if not data.raw[itemType][itemName] then return end
    if not data.raw[itemType][itemName].flags then data.raw[itemType][itemName].flags = {} end

    if next(data.raw[itemType][itemName].flags) then
      for _,flag in pairs(data.raw[itemType][itemName].flags) do
        if flag == "hidden" then
          return -- already hidden
        end
      end
    end

    table.insert(data.raw[itemType][itemName].flags, "hidden")
  end

end -- end of MoreScience.lib.item
