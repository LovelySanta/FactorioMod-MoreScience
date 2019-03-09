
LSlib.item.setSubgroup     ("item", "lab", "ms-science-bottling")
LSlib.item.setLocalisedName("item", "lab", {"item-tier-name.mk1", {"item-name.lab"}})

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["item"]["lab"])
labMK0.name = "lab-mk0"
labMK0.localised_name[1] = "item-tier-name.mk0"
labMK0.order = labMK0.order .. "-mk0"
labMK0.place_result = "lab-mk0"
data:extend{labMK0}

--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(data.raw["item"]["lab"])
labMK2.name = "lab-mk2"
labMK2.localised_name[1] = "item-tier-name.mk2"
labMK2.order = labMK2.order .. "-mk2"
labMK2.place_result = "lab-mk2"
data:extend{labMK2}

--------------------------------------------------------------------------------
----- Lab MK1 - base game lab                                              -----
--------------------------------------------------------------------------------
LSlib.item.setOrderstring("item", "lab", data.raw["item"]["lab"].order  .. "-mk1")
