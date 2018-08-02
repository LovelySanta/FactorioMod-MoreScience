if mods["qol_research"] then

  local scienceResearch = {
    ["science-pack-1"] = nil,
    ["science-pack-2"] = "basic-science-research-1",
    ["science-pack-3"] = "basic-science-research-2",
    ["production-science-pack"] = "advanced-science-research-1",
    ["high-tech-science-pack"] = "advanced-science-research-2",
    ["space-science-pack"] = "infinite-science-research",
    ["military-science-pack"] = "basic-military-science-research",
    ["basic-automation-science-pack"] = "basic-automation-science-research",
    ["basic-logistics-science-pack"] = "basic-logistics-science-research",
    ["basic-power-science-pack"] = "basic-power-science-research",
  }
  local infusedScienceResearch = {
    ["science-pack-1"] = "infused-basic-science-research-1",
    ["science-pack-2"] = "infused-basic-science-research-2",
    ["science-pack-3"] = "infused-basic-science-research-3",
    ["production-science-pack"] = "infused-advanced-science-research-1",
    ["high-tech-science-pack"] = "infused-advanced-science-research-2",
    ["space-science-pack"] = "infinite-science-research",
    ["military-science-pack"] = "infused-basic-military-science-research",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-research",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-research",
    ["basic-power-science-pack"] = "infused-basic-power-science-research",
  }
  local infusedSciencePackName = {
    ["science-pack-1"] = "infused-basic-science-pack-1",
    ["science-pack-2"] = "infused-basic-science-pack-2",
    ["science-pack-3"] = "infused-basic-science-pack-3",
    ["production-science-pack"] = "infused-advanced-science-pack-1",
    ["high-tech-science-pack"] = "infused-advanced-science-pack-2",
    ["space-science-pack"] = "infused-extreme-science-pack",
    ["military-science-pack"] = "infused-basic-military-science-pack",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-pack",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-pack",
    ["basic-power-science-pack"] = "infused-basic-power-science-pack",
  }

  for _, technologyName in pairs({
    "qol-crafting-speed",
    "qol-inventory-size",
    "qol-mining-speed",
    "qol-movement-speed",
    "qol-player-reach",
    "qol-toolbelts",
    "qol-logistic-slots",
  }) do
    for technologyLevel = 1, 9 do
      for technologySubLevel = 1, 5 do
        local fullTechnologyName = technologyName.."-"..technologyLevel.."-"..technologySubLevel
        if data.raw["technology"][fullTechnologyName] and data.raw["technology"][fullTechnologyName].enabled ~= false then

          if data.raw["technology"][fullTechnologyName].unit and data.raw["technology"][fullTechnologyName].unit.ingredients then

            if data.raw["technology"][fullTechnologyName].max_level == "infinite" then
              for index,ingredient in pairs(data.raw["technology"][fullTechnologyName].unit.ingredients) do
                if infusedSciencePackName[ingredient[1]] then
                  MoreScience.lib.technology.addPrerequisite(fullTechnologyName, infusedScienceResearch[ingredient[1]])
                  data.raw["technology"][fullTechnologyName].unit.ingredients[index][1] = infusedSciencePackName[ingredient[1]]
                end
              end

            else
              for _,ingredient in pairs(data.raw["technology"][fullTechnologyName].unit.ingredients) do
                if scienceResearch[ingredient[1]] then
                  MoreScience.lib.technology.addPrerequisite(fullTechnologyName, scienceResearch[ingredient[1]])
                end
              end
            end

          end

        end
      end
    end
  end

end
