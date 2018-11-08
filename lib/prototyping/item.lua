require('lib/utilities/log')
require('lib/utilities/util')

if not MoreScience.lib.item then MoreScience.lib.item = {}

  function MoreScience.lib.item.duplicate(itemType, itemName, newItemName)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    local copy = util.table.deepcopy(data.raw[itemType][itemName])
    copy.name = newItemName
    data:extend{copy}
  end



  function MoreScience.lib.item.changeIcon(itemType, itemName, newIconFile, newIconSize)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].icon = newIconFile
    data.raw[itemType][itemName].icon_size = newIconSize
    data.raw[itemType][itemName].icons = nil
  end



  function MoreScience.lib.item.addIconTint(itemType, itemName, tint)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    if tint.r > 1 or tint.g > 1 or tint.b > 1 then
      tint = MoreScience.lib.util.convertRGB(tint)
    end

    if data.raw[itemType][itemName].icon then
      data.raw[itemType][itemName].icons = {{
        icon = data.raw[itemType][itemName].icon,
        icon_size = data.raw[itemType][itemName].icon_size or 32,
      }}
      data.raw[itemType][itemName].icon = nil
      data.raw[itemType][itemName].icon_size = nil
    end

    if data.raw[itemType][itemName].icons then
      for _,iconLayer in pairs(data.raw[itemType][itemName].icons) do
        iconLayer.tint = util.table.deepcopy(tint)
      end
    end
  end



  function MoreScience.lib.item.setHidden(itemType, itemName)
    if not data.raw[itemType] then return end
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



  function MoreScience.lib.item.setStackSize(itemType, itemName, stackSize)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].stack_size = stack_size
  end



  function MoreScience.lib.item.editStackSize(itemType, itemName, amountMultiplier)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].stack_size = data.raw[itemType][itemName].stack_size * amountMultiplier
  end



  function MoreScience.lib.item.setLocalisedName(itemType, itemName, localeString)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].localised_name = localeString
  end



  function MoreScience.lib.item.setSubgroup(itemType, itemName, subgroup)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].subgroup = subgroup
  end



  function MoreScience.lib.item.setOrderstring(itemType, itemName, orderstring)
    if not data.raw[itemType] then return end
    if not data.raw[itemType][itemName] then return end

    data.raw[itemType][itemName].order = orderstring
  end

end -- end of MoreScience.lib.item
