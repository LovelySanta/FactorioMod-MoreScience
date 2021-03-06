data:extend{
  {
    type = "item",
    name = "sand",
    icon = "__MoreScience__/graphics/icons/sand.png",
    icon_size = 32,
    --flags = {},
    subgroup = "ms-science-raw-material",
    order = "z-MoreScience-z[sand]",
    stack_size = 100
  },

  {
    type = "item",
    name = "glass",
    icon = "__MoreScience__/graphics/icons/glass.png",
    icon_size = 32,
    --flags = {},
    subgroup = "ms-science-bottling",
    order = "c[glass]",
    stack_size = 50
  },

  {
    type = "item",
    name = "cork",
    icon = "__MoreScience__/graphics/icons/cork.png",
    icon_size = 128,
    --flags = {},
    subgroup = "ms-science-bottling",
    order = "d[cork]",
    stack_size = 50
  },

  {
    type = "item",
    name = "empty-bottle",
    icons =
    {
      {
        icon = "__MoreScience__/graphics/icons/potion/set-01/potion-00.png",
        icon_size = 32,
      },
      {
        icon = "__MoreScience__/graphics/icons/potion/cork.png",
        icon_size = 32,
      },
    },
    --flags = {},
    subgroup = "ms-science-bottling",
    order = "d[empty-bottle]",
    stack_size = 50,
  },
}
