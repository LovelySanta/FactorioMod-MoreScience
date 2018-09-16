--------------------------------------------------------------------------------
----- Regular science packs                                                -----
--------------------------------------------------------------------------------

-- basic science pack 1 (handcrafting)
data.raw["recipe"]["science-pack-1"].ingredients =
{
  {"copper-plate", 2},
  {"iron-gear-wheel", 1},
}
data.raw["recipe"]["science-pack-1"].energy_required = 1
data.raw["recipe"]["science-pack-1"].category = "ms-basic-crafting"
data.raw["recipe"]["science-pack-1"].subgroup = "science-bottling"
data.raw["recipe"]["science-pack-1"].order = "e[science-pack-1]"
data.raw["recipe"]["science-pack-1"].always_show_made_in = true
table.insert(data.raw["player"]["player"].crafting_categories, "ms-basic-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "ms-basic-crafting")

-- basic science pack 1 (automation)
data:extend({
  {
    type = "recipe",
    name = "science-pack-1-advanced",
    category = "crafting-with-fluid",
    energy_required = 2.5,
    ingredients =
    {
      {"empty-bottle", 1},
      {type="fluid", name="basic-science-fluid-1", amount=10},
    },
    result = "science-pack-1",
    enabled = false
  },
})



-- basic science pack 2
data.raw["recipe"]["science-pack-2"].category = "crafting-with-fluid"
data.raw["recipe"]["science-pack-2"].ingredients =
{
  {"empty-bottle", 1},
  {type="fluid", name="basic-science-fluid-2", amount=10},
}
data.raw["recipe"]["science-pack-2"].energy_required = 2.5



-- basic science pack 3
data.raw["recipe"]["science-pack-3"].category = "crafting-with-fluid"
data.raw["recipe"]["science-pack-3"].ingredients =
{
  {"empty-bottle", 1},
  {type="fluid", name="basic-science-fluid-3", amount=10},
}
data.raw["recipe"]["science-pack-3"].energy_required = 10



-- military science pack
data.raw["recipe"]["military-science-pack"].category = "crafting-with-fluid"
data.raw["recipe"]["military-science-pack"].ingredients =
{
  {"empty-bottle", 1},
  {type="fluid", name="basic-military-science-fluid", amount=10},
}
data.raw["recipe"]["military-science-pack"].result_count = 1
data.raw["recipe"]["military-science-pack"].energy_required = 5



-- advanced science pack 1
data.raw["recipe"]["production-science-pack"].category = "crafting-with-fluid"
data.raw["recipe"]["production-science-pack"].ingredients =
{
  {"empty-bottle", 1},
  {type="fluid", name="advanced-science-fluid-1", amount=10},
}
data.raw["recipe"]["production-science-pack"].result_count = 1
data.raw["recipe"]["production-science-pack"].energy_required = 20



-- advanced science pack 2
data.raw["recipe"]["high-tech-science-pack"].category = "crafting-with-fluid"
data.raw["recipe"]["high-tech-science-pack"].ingredients =
{
  {"empty-bottle", 1},
  {type="fluid", name="advanced-science-fluid-2", amount=10},
}
data.raw["recipe"]["high-tech-science-pack"].result_count = 1
data.raw["recipe"]["high-tech-science-pack"].energy_required = 30



-- basic automation science pack
data:extend({
  {
    type = "recipe",
    name = "basic-automation-science-pack",
    category = "crafting-with-fluid",
    energy_required = 5,
    ingredients =
    {
      {"empty-bottle", 1},
      {type="fluid", name="basic-automation-science-fluid", amount=10},
    },
    result = "basic-automation-science-pack",
    enabled = false
  },
})



-- basic power science pack
data:extend({
  {
    type = "recipe",
    name = "basic-power-science-pack",
    category = "crafting-with-fluid",
    energy_required = 10,
    ingredients =
    {
      {"empty-bottle", 1},
      {type="fluid", name="basic-power-science-fluid", amount=10},
    },
    result = "basic-power-science-pack",
    enabled = false
  },
})



-- basic logistics science pack
data:extend({
  {
    type = "recipe",
    name = "basic-logistics-science-pack",
    category = "crafting-with-fluid",
    energy_required = 20,
    ingredients =
    {
      {"empty-bottle", 1},
      {type="fluid", name="basic-logistics-science-fluid", amount=10},
    },
    result = "basic-logistics-science-pack",
    enabled = false
  },
})
