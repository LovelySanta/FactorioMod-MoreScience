local function numberToString(number)
  if number >= 10 then return "" .. number else return "0" .. number end
end

local function getFluidOrder(scienceName)
  return MoreScience.lib.util.stringSplit(
           MoreScience.lib.util.stringSplit(
             data.raw["fluid"][string.format(scienceName, "fluid")].order,
           "-")[3],
         "[")[1]
end

local function alterSciencePack(scienceName, scienceNumber)
  sciencePack = data.raw["tool"][string.format(scienceName, "pack")]

  sciencePack.icon = nil
  sciencePack.icon_size = nil
  sciencePack.icons =
  {
    {
      icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. numberToString(scienceNumber) .. ".png",
      icon_size = 32,
    },
    {
      icon = "__MoreScience__/graphics/icons/potion/cork.png",
      icon_size = 32,
    },
  }
  data.raw["tool"][ sciencePack.name] = util.table.deepcopy(sciencePack)

  MoreScience.lib.item.setSubgroup   ("tool", sciencePack.name, "science-pack")
  MoreScience.lib.item.setOrderstring("tool", sciencePack.name, "z-MoreScience-" .. getFluidOrder(scienceName) .. "[" ..  sciencePack.name .. "]")
end

local function addSciencePack(scienceName, scienceNumber)
  data:extend({
    {
      type = "tool",
      name = string.format(scienceName, "pack"),
      localised_description = {"item-description.science-pack"},
      icons =
      {
        {
          icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. numberToString(scienceNumber) .. ".png",
          icon_size = 32,
        },
        {
          icon = "__MoreScience__/graphics/icons/potion/cork.png",
          icon_size = 32,
        },
      },
      --flags = {},
      subgroup = "science-pack",
      order = "z-MoreScience-" .. getFluidOrder(scienceName) .. "[" .. string.format(scienceName, "pack") .. "]",
      stack_size = 200,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value"
    },
  })
end



alterSciencePack("automation-science-%s"         , 14)
alterSciencePack("logistic-science-%s"           , 03)
alterSciencePack("military-science-%s"           , 09)
addSciencePack  ("advanced-automation-science-%s", 15)
addSciencePack  ("electric-power-science-%s"     , 05)
alterSciencePack("chemical-science-%s"           , 08)
--alterSciencePack("production-science-%s", 10)
--alterSciencePack("high-tech-science-%s", 2)
--addSciencePack("basic-logistics-science-%s", 13)
--alterSciencePack("space-science-%s", 1)
