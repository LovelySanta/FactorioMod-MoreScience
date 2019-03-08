local rocketParts = require ("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- Rocket-MK1                                                           -----
--------------------------------------------------------------------------------
data.raw["recipe"]["rocket-part"].energy_required = data.raw["recipe"]["rocket-part"].energy_required * 100
data.raw["recipe"]["rocket-part"].hidden = nil
data.raw["recipe"]["rocket-part"].ingredients =
{
  {rocketParts.hull   , 30},
  {rocketParts.engine1, 05},
  {rocketParts.engine2, 01},
  {rocketParts.power  , 02},
  {rocketParts.defence, 03},
  {rocketParts.attack , 03},
}
