
data:extend({
  {
    type = "recipe",
    name = "sand",
    energy_required = 25,
    category = "advanced-crafting",
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
    category = "advanced-crafting",
    ingredients =
    {
      {"cork", 1},
      {"glass", 3},
    },
    result = "empty-bottle",
    enabled = false,
  },
})
