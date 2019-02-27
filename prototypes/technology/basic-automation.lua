data:extend({
  {
    type = "technology",
    name = "basic-automation",
    icon = "__base__/graphics/technology/automation.png",
    icon_size = 128,
    prerequisites = nil,
    unit =
    {
      count = 5,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 5
    },
    order = "a-b-a",
  },
})

-- recipes that gets unlocked with this technology
for _, recipeName in pairs{
  "inserter",
  "transport-belt",
  "electric-mining-drill",
  "lab",
} do
  MoreScience.lib.recipe.disable(recipeName)
  MoreScience.lib.technology.addRecipeUnlock("basic-automation", recipeName)
end

-- other technologies that depend on this
MoreScience.lib.technology.addPrerequisite("automation"      , "basic-automation")
MoreScience.lib.technology.addPrerequisite("logistics"       , "basic-automation")
MoreScience.lib.technology.addPrerequisite("steel-processing", "basic-automation")
MoreScience.lib.technology.addPrerequisite("optics"          , "basic-automation")
