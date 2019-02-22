
data.raw["item"]["lab"].subgroup = "science-bottling"
data.raw["item"]["lab"].localised_name = {"entity-name.lab-mk1", {[1] = "item-name.lab"}}

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["item"]["lab"])
labMK0.name = "lab-mk0"
labMK0.localised_name = {"entity-name.lab-mk0", {[1] = "item-name.lab"}}
labMK0.order = labMK0.order .. "-mk0"
labMK0.place_result = "lab-mk0"
data:extend{labMK0}

--------------------------------------------------------------------------------
----- Lab MK1 - base game lab                                              -----
--------------------------------------------------------------------------------
data.raw["item"]["lab"].order = data.raw["item"]["lab"].order  .. "-mk1"
