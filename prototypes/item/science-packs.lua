local function numberToString(number)
  if number >= 10 then return "" .. number else return "0" .. number end
end

local function getFluidOrder(potionName)
  return MoreScience.lib.util.stringSplit(
           MoreScience.lib.util.stringSplit(
             data.raw["fluid"][potionName .. "-fluid"].order,
           "-")[3],
         "[")[1]
end

local function alterSciencePack(potionName, potionNumber)
  sciencePack = data.raw["tool"][potionName]

  sciencePack.icon = nil
  sciencePack.icon_size = nil
  sciencePack.icons =
  {
    {
      icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. numberToString(potionNumber) .. ".png",
      icon_size = 32,
    },
    {
      icon = "__MoreScience__/graphics/icons/potion/cork.png",
      icon_size = 32,
    },
  }
  data.raw["tool"][potionName] = util.table.deepcopy(sciencePack)

  MoreScience.lib.item.setSubgroup   ("tool", sciencePack.name, "science-pack")
  MoreScience.lib.item.setOrderstring("tool", sciencePack.name, "z-MoreScience-" .. getFluidOrder(potionName) .. "[" .. potionName .. "]")
end

local function addSciencePack(potionName, potionNumber)
  data:extend({
    {
      type = "tool",
      name = potionName,
      localised_description = {"item-description.science-pack"},
      icons =
      {
        {
          icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. numberToString(potionNumber) .. ".png",
          icon_size = 32,
        },
        {
          icon = "__MoreScience__/graphics/icons/potion/cork.png",
          icon_size = 32,
        },
      },
      flags = {"goes-to-main-inventory"},
      subgroup = "science-pack",
      order = "z-MoreScience-" .. getFluidOrder(potionName) .. "[" .. potionName .. "]",
      stack_size = 200,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value"
    },
  })
end



alterSciencePack("science-pack-1", 14)
alterSciencePack("science-pack-2", 3)
--alterSciencePack("military-science-pack", 9)
--addSciencePack("basic-automation-science-pack", 15)
--alterSciencePack("science-pack-3", 8)
--addSciencePack("basic-power-science-pack", 5)
--alterSciencePack("production-science-pack", 10)
--alterSciencePack("high-tech-science-pack", 2)
--addSciencePack("basic-logistics-science-pack", 13)
--alterSciencePack("space-science-pack", 1)
