local rocketParts = require ("prototypes/settings").rocketParts

local hullComponent =
{
  type = "recipe",
  name = rocketParts.hull,
  energy_required = 40,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 25},
    {"rocket-control-unit"  , 01},
  },
  result = rocketParts.hull,
}

local ionThruster =
{
  type = "recipe",
  name = rocketParts.engine1,
  energy_required = hullComponent.energy_required * 3,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 10},
    {"rocket-fuel", 75},
    {"rocket-control-unit", 60},
  },
  result = rocketParts.engine1,
}

local ionBooster =
{
  type = "recipe",
  name = rocketParts.engine2,
  energy_required = ionThruster.energy_required * (5 + 5),
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 30},
    {"rocketpart-ion-thruster", 5},
    {"rocket-fuel", 150}, -- 1000 - (5+5)*75 - 100
    {"rocket-control-unit", 40},
  },
  result = rocketParts.engine2,
}

local fusionReactor =
{
  type = "recipe",
  name = rocketParts.power,
  energy_required = ionBooster.energy_required / 2,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"fusion-reactor-equipment", 1},
    {"rocket-control-unit", 15},
    {"nuclear-fuel", 50},
  },
  result = rocketParts.power,
}

local shieldArray =
{
  type = "recipe",
  name = rocketParts.defence,
  energy_required = ionBooster.energy_required / 3,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 20},
    {"rocket-control-unit", 50},
    {"energy-shield-mk2-equipment", 5},
    {"radar", 10},
  },
  result = rocketParts.defence,
}

local laserArray =
{
  type = "recipe",
  name = rocketParts.attack,
  energy_required = shieldArray.energy_required,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 20},
    {"rocket-control-unit", 50},
    {"discharge-defense-equipment", 5},
    {"radar", 10},
  },
  result = rocketParts.attack,
}

local payloadContainer =
{
  type = "recipe",
  name = string.format(rocketParts.container, "mk1"),
  energy_required = fusionReactor.energy_required / 2,
  category = rocketParts.category,
  ingredients =
  {
    {"low-density-structure", 5},
    {"flying-robot-frame", 1}
  },
  result = string.format(rocketParts.container, "mk1"),
  result_count = 1,
  enabled = false,
}

-- Rocket MK1 calculation:
data:extend({    --      amount:   lds    rcu    rf
  hullComponent, --      30        25     1      0

  ionThruster  , --      5 (+5)    10     60     75
  ionBooster   , --      1         30     40     150

  fusionReactor, --      2         0      15     (50)

  shieldArray  , --      3         20     50     0
  laserArray   , --      3         20     50     0
                 --               ----    ----   ----
                 --     total:    1000    1000   1000

  payloadContainer,
})
