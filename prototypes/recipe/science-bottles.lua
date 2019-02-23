data:extend{
  {
    type = "recipe",
    name = "sand",
    energy_required = 25,
    category = "ms-advanced-crafting",
    ingredients =
    {
      {"stone", 2}
    },
    result = "sand",
    result_count = 4,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cork",
    energy_required = 1,
    ingredients =
    {
      {"wood", 2}
    },
    result = "cork",
    result_count = 5,
    enabled = false,
  },

  {
    type = "recipe",
    name = "glass",
    energy_required = 3.5,
    category = "smelting",
    ingredients =
    {
      {"sand", 2}
    },
    result = "glass",
    result_count = 1,
    enabled = false,
  },

  {
    type = "recipe",
    name = "empty-bottle",
    energy_required = 5,
    category = "ms-advanced-crafting",
    ingredients =
    {
      {"cork", 1},
      {"glass", 3},
    },
    result = "empty-bottle",
    enabled = false,
  },

  {
    type = "recipe",
    name = "purified-water",
    category = "ms-chemical-crafting",
    icon = "__MoreScience__/graphics/icons/fluid/fluid-00.png",
    icon_size = 32,
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="water", amount=20},
    },
    results =
    {
      {type="fluid", name="purified-water", amount = 10},
      {type="item", name="sand", amount = 1, probability = .5},
    },
    main_product = "purified-water",
    crafting_machine_tint =
    {
      primary   = {r = 0.331, g = 0.075, b = 0.510, a = 0.000}, -- #54138200
      secondary = {r = 0.589, g = 0.540, b = 0.615, a = 0.361}, -- #96899c5c
      tertiary  = {r = 0.469, g = 0.145, b = 0.695, a = 0.000}, -- #7724b100
    },
  }
}
