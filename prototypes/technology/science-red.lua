local scienceTech    = require("prototypes/settings").techIcons
local scienceNames   = require("prototypes/settings").scienceNames
local redScienceName = scienceNames.red

data:extend{
--------------------------------------------------------------------------------
----- purification research                                                -----
--------------------------------------------------------------------------------
  {
    type = "technology",
    name = "purification-research",
    icons =
    {
      {
        icon = "__MoreScience__/graphics/technology/chemical-plant-tech.png",
        icon_size = 128,
      },
      {
        icon = "__MoreScience__/graphics/technology/water-purification-tech.png",
        icon_size = 64,
        shift = {32, 32},
      },
    },
    prerequisites =
    {
      --"logistics",
      --"steel-processing",
      "fluid-handling",
      "electronics"
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chemical-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "sand",
      },
      {
        type = "unlock-recipe",
        recipe = "purified-water",
      },
    },
    unit =
    {
      count = 35,
      ingredients =
      {
        {string.format(redScienceName, "pack"), 1},
      },
      time = 5,
    },
    upgrade = false,
    order = "c-a"
  },
}
LSlib.technology.removeRecipeUnlock("oil-processing", "chemical-plant")

--------------------------------------------------------------------------------
----- bottling research                                                    -----
--------------------------------------------------------------------------------
data:extend{
  {
    type = "technology",
    name = "bottling-research",
    icon = scienceTech.icon .. "potion-empty.png",
    icon_size = scienceTech.icon_size,
    prerequisites =
    {
      --"automation-2",
      --"logistics",
      --"steel-processing",
      --"fluid-handling",
      --"electronics"
      "purification-research"
    },
    effects =
    {
      --[[{
        type = "unlock-recipe",
        recipe = "purified-water",
      },]]
      --[[{
        type = "unlock-recipe",
        recipe = "sand",
      },]]
      {
        type = "unlock-recipe",
        recipe = "glass",
      },
      {
        type = "unlock-recipe",
        recipe = "cork",
      },
      {
        type = "unlock-recipe",
        recipe = "empty-bottle",
      },
      --[[{
        type = "unlock-recipe",
        recipe = "chemical-plant",
      },]]
      {
        type = "unlock-recipe",
        recipe = string.format(redScienceName, "fluid"),
      },
      {
        type = "unlock-recipe",
        recipe = string.format(redScienceName, "pack"),
      },
    },
    unit =
    {
      count = 40,
      ingredients =
      {
        {string.format(redScienceName, "pack"), 2},
      },
      time = 10,
    },
    upgrade = false,
    order = "c-a"
  },
}

--------------------------------------------------------------------------------
----- stone brick research                                                 -----
--------------------------------------------------------------------------------
local brick = util.table.deepcopy(data.raw["technology"]["concrete"])
brick.name = "brick-processing"

brick.prerequisites =
{
  "basic-automation",
}
brick.effects = nil
brick.unit = util.table.deepcopy(data.raw["technology"]["logistics"].unit)

brick.order                                 = data.raw["technology"]["stone-wall"].order .. "[brick]"
data.raw["technology"]["stone-wall"].order = data.raw["technology"]["stone-wall"].order .. "[wall]"
data:extend{brick}

for _,recipeName in pairs{
  "stone-brick"
} do
  LSlib.recipe.disable(recipeName)
  LSlib.technology.addRecipeUnlock(brick.name, recipeName)
end

-- other technologies that depend on this one
for _,techName in pairs{
  "stone-wall",
  "oil-processing",
  "advanced-material-processing",
} do
  LSlib.technology.addPrerequisite(techName, brick.name)
end



--------------------------------------------------------------------------------
----- other red science technologies                                       -----
--------------------------------------------------------------------------------

-- research speed 1
LSlib.technology.removePrerequisite("research-speed-1", "automation-2"         )
LSlib.technology.addPrerequisite   ("research-speed-1", "bottling-research"    )
LSlib.technology.removeIngredient  ("research-speed-1", "logistic-science-pack")

LSlib.technology.addPrerequisite("fast-inserter", "logistics")
