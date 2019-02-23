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
    icon = "__MoreScience__/graphics/technology/chemical-plant-tech.png",
    icon_size = scienceResearch.icon_size,
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

--------------------------------------------------------------------------------
----- bottling research                                                    -----
--------------------------------------------------------------------------------
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
      --[[{
        type = "unlock-recipe",
        recipe = "basic-science-fluid-1",
      },
      {
        type = "unlock-recipe",
        recipe = "science-pack-1-advanced",
      },]] --TODO
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
