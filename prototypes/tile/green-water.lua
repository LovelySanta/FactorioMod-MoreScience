local noise = require("noise")

local undeepBlueWater  = data.raw["tile"]["deepwater"]
local   deepBlueWater  = data.raw["tile"][    "water"]

local undeepGreenWater = data.raw["tile"][undeepBlueWater.name.."-green"]
local   deepGreenWater = data.raw["tile"][  deepBlueWater.name.."-green"]

undeepGreenWater.transitions_between_transitions = nil
undeepGreenWater.allowed_neighbors = nil
undeepGreenWater.needs_correction = false

undeepGreenWater.autoplace = {}
  deepGreenWater.autoplace = {}

--[[
undeepGreenWater.autoplace.probability_expression = noise.var("temperature")-15 + undeepBlueWater.autoplace.probability_expression
  deepGreenWater.autoplace.probability_expression = noise.var("temperature")-15 +   deepBlueWater.autoplace.probability_expression
]]

local transition_rule = noise.var("moisture") - 0.2
local influence_trench = noise.max(transition_rule, 0 - transition_rule) -- zero when moisture is -0.2
local tranch_gradient = 2 -- higher = smaller land barrier
influence_trench = noise.clamp(influence_trench * tranch_gradient, 0, 1) -- don't want to mess up other things

undeepGreenWater.autoplace.probability_expression = influence_trench * (transition_rule + undeepBlueWater.autoplace.probability_expression)
  deepGreenWater.autoplace.probability_expression = influence_trench * (transition_rule +   deepBlueWater.autoplace.probability_expression)

undeepBlueWater.autoplace.probability_expression = influence_trench * (undeepBlueWater.autoplace.probability_expression)
  deepBlueWater.autoplace.probability_expression = influence_trench * (  deepBlueWater.autoplace.probability_expression)
