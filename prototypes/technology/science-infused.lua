local scienceNames = require("prototypes/settings").scienceNames

local scienceColor = {
  [scienceNames.red   ] = "red"      ,
  [scienceNames.green ] = "green"    ,
  [scienceNames.blue  ] = "blue"     ,
  [scienceNames.purple] = "purple"   ,
  [scienceNames.yellow] = "yellow"   ,
  [scienceNames.white ] = "white"    ,
  [scienceNames.gray  ] = "gray"     ,
  [scienceNames.orange] = "orange"   ,
  [scienceNames.pink  ] = "pink"     ,
  [scienceNames.cyan  ] = "lightblue",
}

local function addInfusedSciencePack(scienceName, order)
  data:extend({
    {
      type = "technology",
      name = "infused-"..string.format(scienceName, "pack"),
      localised_name = {"technology-name.infuse-research"},
      localised_description = {"technology-description.infuse-research"},
      icon = "__MoreScience__/graphics/technology/potions/potion-" .. scienceColor[scienceName] .. "-infused.png",
      icon_size = 128,
      prerequisites = nil,
      effects = nil,
      unit =
      {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
        },
        time = 60
      },
      upgrade = false,
      order = data.raw["technology"][string.format(scienceNames.white, "pack")].order .. "-" .. order
    },
  })

  MoreScience.lib.technology.addIngredient  ("infused-"..string.format(scienceName, "pack"), 2, string.format(scienceName, "pack"))
  MoreScience.lib.technology.addRecipeUnlock("infused-"..string.format(scienceName, "pack"), "infused-"..string.format(scienceName, "pack"))
end

addInfusedSciencePack(scienceNames.red   , "a1")
addInfusedSciencePack(scienceNames.green , "b1")
addInfusedSciencePack(scienceNames.gray  , "b2")
addInfusedSciencePack(scienceNames.orange, "c1")
addInfusedSciencePack(scienceNames.cyan  , "c2")
addInfusedSciencePack(scienceNames.blue  , "d1")
addInfusedSciencePack(scienceNames.purple, "d2")
addInfusedSciencePack(scienceNames.yellow, "d3")
addInfusedSciencePack(scienceNames.pink  , "d1")
MoreScience.lib.technology.addRecipeUnlock(            string.format(scienceNames.white , "pack"), "infused-"..string.format(scienceNames.white , "pack"))
MoreScience.lib.technology.addRecipeUnlock(            string.format(scienceNames.white , "pack"), "lab-mk2"                                             )

MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.red   , "pack"),             string.format(scienceNames.white , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.green , "pack"), "infused-"..string.format(scienceNames.red   , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.gray  , "pack"), "infused-"..string.format(scienceNames.red   , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.orange, "pack"), "infused-"..string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.cyan  , "pack"), "infused-"..string.format(scienceNames.green , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.blue  , "pack"), "infused-"..string.format(scienceNames.orange, "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.purple, "pack"), "infused-"..string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.purple, "pack"), "infused-"..string.format(scienceNames.cyan  , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.yellow, "pack"), "infused-"..string.format(scienceNames.blue  , "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.pink  , "pack"), "infused-"..string.format(scienceNames.purple, "pack"))
MoreScience.lib.technology.addPrerequisite("infused-"..string.format(scienceNames.pink  , "pack"), "infused-"..string.format(scienceNames.yellow, "pack"))

--------------------------------------------------------------------------------
----- other infused science technologies                                   -----
--------------------------------------------------------------------------------
-- swap all existing potions out for there infused variant
for _,techName in pairs{
  "physical-projectile-damage-7",
  "stronger-explosives-7"       ,
  "refined-flammables-7"        ,
  "mining-productivity-4"       ,
  "follower-robot-count-7"      ,
  "energy-weapons-damage-7"     ,
  "worker-robots-speed-6"       ,
  "artillery-shell-range-1"     ,
  "artillery-shell-speed-1"     ,
} do
  for ingredientIndex, ingredient in pairs(data.raw["technology"][techName].unit.ingredients) do
    ingredient[1] = "infused-"..ingredient[1]
  end
end

for _,techName in pairs{
  "physical-projectile-damage-7",
  "stronger-explosives-7"       ,
  "refined-flammables-7"        ,
  --"mining-productivity-4"       ,
  "follower-robot-count-7"      ,
  "energy-weapons-damage-7"     ,
  --"worker-robots-speed-6"       ,
  "artillery-shell-range-1"     ,
  "artillery-shell-speed-1"     ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, "infused-"..string.format(scienceNames.gray, "pack"))
end
for _,techName in pairs{
  "physical-projectile-damage-7",
  "stronger-explosives-7"       ,
  "refined-flammables-7"        ,
  "mining-productivity-4"       ,
  "follower-robot-count-7"      ,
  "energy-weapons-damage-7"     ,
  "artillery-shell-range-1"     ,
  "artillery-shell-speed-1"     ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, "infused-"..string.format(scienceNames.yellow, "pack"))
end
for _,techName in pairs{
  "mining-productivity-4"       ,
  "follower-robot-count-7"      ,
  "energy-weapons-damage-7"     ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, "infused-"..string.format(scienceNames.cyan, "pack"))
end
for _,techName in pairs{
  "mining-productivity-4"       ,
  "follower-robot-count-7"      ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, "infused-"..string.format(scienceNames.purple, "pack"))
end
for _,techName in pairs{
  "worker-robots-speed-6"       ,
} do
  MoreScience.lib.technology.addPrerequisite(techName, "infused-"..string.format(scienceNames.pink, "pack"))
end
