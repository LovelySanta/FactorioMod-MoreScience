local scienceNames     = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK0.name = "lab-mk0"
labMK0.enabled = true
data:extend{labMK0}
LSlib.recipe.removeIngredient(labMK0.name, "transport-belt")
LSlib.recipe.addIngredient(labMK0.name, "boiler", 1)
LSlib.recipe.editResult(labMK0.name, "lab", labMK0.name, 1)
LSlib.recipe.enable(labMK0.name)



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
data.raw["recipe"]["lab"].ingredients = {
  {"lab-mk0", 1},
  {"transport-belt", 4}
}
LSlib.recipe.setEngergyRequired("lab", 5 * LSlib.recipe.getEngergyRequired("lab"))



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK2.name = "lab-mk2"
labMK2.normal = nil
labMK2.expensive = nil
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
