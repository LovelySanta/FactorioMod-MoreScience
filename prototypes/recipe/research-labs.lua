local scienceNames     = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK0.name = "lab-mk0"
for index,ingredient in pairs(labMK0.ingredients) do
  if ingredient[1] == "transport-belt" then
    table.remove(labMK0.ingredients, index)
    break
  end
end
table.insert(labMK0.ingredients, {"boiler", 1})
labMK0.result = "lab-mk0"
labMK0.enabled = true
data:extend{labMK0}



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
data.raw["recipe"]["lab"].ingredients = {
  {"lab-mk0", 1},
  {"transport-belt", 4}
}
data.raw["recipe"]["lab"].energy_required = labMK0.energy_required * 5



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK2.name = "lab-mk2"
labMK2.category = "ms-advanced-crafting"
labMK2.energy_required = 120
labMK2.ingredients = {
  {"lab", 1},
  {"fusion-reactor-equipment", 1},
  {type="fluid", name=string.format(scienceNames.white, "fluid"), amount=250},
}
labMK2.result = "lab-mk2"
labMK2.enabled = false
data:extend{labMK2}
