require("lib/prototyping/technology")
local fluidIconSettings = require("prototypes/settings").fluidIcons

function createFluidTechTreeOnly()

  for techName, techProto in pairs(data.raw["technology"]) do

  data.raw["technology"][techName].hidden = true

  end

  for techIndex, techName in pairs{
    "bottling-research"               ,
    "logistic-science-pack"           ,
    "military-science-pack"           ,
    "chemical-science-pack"           ,
    "production-science-pack"         ,
    "utility-science-pack"            ,
    "space-science-pack"              ,
    "electric-power-science-pack"     ,
    "advanced-automation-science-pack",
    "advanced-logistic-science-pack"  ,
  } do
    if data.raw["technology"][techName].hidden then
      data.raw["technology"][techName].hidden = false
      data.raw["technology"][techName].prerequisites = {}
      data.raw["technology"][techName].effects = {}
    end
  end
  MoreScience.lib.technology.changeIcon("bottling-research", "__MoreScience__/graphics/icons/fluid/fluid-14.png", 32)

  MoreScience.lib.technology.changeIcon("logistic-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-03.png", 32)
  data.raw["technology"]["logistic-science-pack"].prerequisites = {"bottling-research"}

  MoreScience.lib.technology.changeIcon("military-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-09.png", 32)
  data.raw["technology"]["military-science-pack"].prerequisites = {"bottling-research"}

  MoreScience.lib.technology.changeIcon("chemical-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-08.png", 32)
  data.raw["technology"]["chemical-science-pack"].prerequisites = {"advanced-automation-science-pack"}

  MoreScience.lib.technology.changeIcon("production-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-10.png", 32)
  data.raw["technology"]["production-science-pack"].prerequisites = {"electric-power-science-pack"}

  MoreScience.lib.technology.changeIcon("utility-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-02.png", 32)
  data.raw["technology"]["utility-science-pack"].prerequisites = {"chemical-science-pack"}

  MoreScience.lib.technology.changeIcon("space-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-01.png", 32)
  data.raw["technology"]["space-science-pack"].prerequisites = {"advanced-logistic-science-pack"}

  MoreScience.lib.technology.changeIcon("electric-power-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-05.png", 32)
  data.raw["technology"]["electric-power-science-pack"].prerequisites = {"logistic-science-pack"}

  MoreScience.lib.technology.changeIcon("advanced-automation-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-15.png", 32)
  data.raw["technology"]["advanced-automation-science-pack"].prerequisites = {"logistic-science-pack"}

  MoreScience.lib.technology.changeIcon("advanced-logistic-science-pack", "__MoreScience__/graphics/icons/fluid/fluid-13.png", 32)
  data.raw["technology"]["advanced-logistic-science-pack"].prerequisites = {"utility-science-pack", "production-science-pack"}

end

createFluidTechTreeOnly()
