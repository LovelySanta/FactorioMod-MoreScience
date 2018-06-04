
--------------------------------------------------------------------------------
----- Rocket-MK1                                                           -----
--------------------------------------------------------------------------------

data.raw["recipe"]["rocket-part"].energy_required = data.raw["recipe"]["rocket-part"].energy_required * 100
data.raw["recipe"]["rocket-part"].hidden = nil
data.raw["recipe"]["rocket-part"].ingredients =
{
  {"rocketpart-hull-component", 30},
  {"rocketpart-ion-thruster", 5},
  {"rocketpart-ion-booster", 1},
  {"rocketpart-fusion-reactor", 2},
  {"rocketpart-shield-array", 3},
  {"rocketpart-laser-array", 3},
}
