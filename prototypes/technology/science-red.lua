local scienceResearch = {}
scienceResearch.icon = "__MoreScience__/graphics/technology/potions/"
scienceResearch.icon_size = 128



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
        {"science-pack-1", 1},
      },
      time = 5,
    },
    upgrade = false,
    order = "c-a"
  },
}
MoreScience.lib.technology.removeRecipeUnlock("oil-processing", "chemical-plant")

--------------------------------------------------------------------------------
----- bottling research                                                    -----
--------------------------------------------------------------------------------
data:extend{
  {
    type = "technology",
    name = "bottling-research",
    icon = scienceResearch.icon .. "potion-empty.png",
    icon_size = scienceResearch.icon_size,
    prerequisites =
    {
      "automation-2",
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
        recipe = "science-pack-1-fluid",
      },
      {
        type = "unlock-recipe",
        recipe = "science-pack-1",
      },
    },
    unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 2},
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
brick.name = "brick"

brick.prerequisites =
{
  "basic-automation",
}
brick.effects = nil
brick.unit = util.table.deepcopy(data.raw["technology"]["logistics"].unit)

brick.order                                 = data.raw["technology"]["stone-walls"].order .. "[brick]"
data.raw["technology"]["stone-walls"].order = data.raw["technology"]["stone-walls"].order .. "[wall]"
data:extend{brick}

for _,recipeName in pairs{
  "stone-brick"
} do
  MoreScience.lib.recipe.disable(recipeName)
  MoreScience.lib.technology.addRecipeUnlock(brick.name, recipeName)
end

-- other technologies that depend on this one
for _,techName in pairs{
  "stone-walls",
  "oil-processing",
  "advanced-material-processing",
} do
  MoreScience.lib.technology.addPrerequisite(techName, brick.name)
end



--------------------------------------------------------------------------------
----- other red science technologies                                       -----
--------------------------------------------------------------------------------

-- research speed 1
MoreScience.lib.technology.removePrerequisite("research-speed-1", "electronics")
MoreScience.lib.technology.addPrerequisite("research-speed-1", "bottling-research")
MoreScience.lib.technology.removeIngredient("research-speed-1", "science-pack-2")
