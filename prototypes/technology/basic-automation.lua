local scienceNames = require("prototypes/settings").scienceNames

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
        {string.format(scienceNames.red, "pack"), 1}
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
  LSlib.recipe.disable(recipeName)
  LSlib.technology.addRecipeUnlock("basic-automation", recipeName)
end

-- other technologies that depend on this
LSlib.technology.addPrerequisite("automation"      , "basic-automation")
LSlib.technology.addPrerequisite("logistics"       , "basic-automation")
LSlib.technology.addPrerequisite("steel-processing", "basic-automation")
LSlib.technology.addPrerequisite("optics"          , "basic-automation")
