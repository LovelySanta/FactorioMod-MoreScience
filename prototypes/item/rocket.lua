local rocket      = require ("prototypes/settings").rocket
local rocketGroup = "ms-science-" .. rocket.subgroup

--------------------------------------------------------------------------------
----- Rocket-silo                                                          -----
--------------------------------------------------------------------------------
LSlib.item.setSubgroup   ("item", "rocket-silo", rocketGroup)
LSlib.item.setOrderstring("item", "rocket-silo", "a[rocket-silo]")


--------------------------------------------------------------------------------
----- Rocket-MK1                                                           -----
--------------------------------------------------------------------------------
LSlib.item.changeIcon    ("item", "rocket-part", "__MoreScience__/graphics/technology/rocket-tech.png", 250)
LSlib.item.setSubgroup   ("item", "rocket-part", rocketGroup)
LSlib.item.setOrderstring("item", "rocket-part", "b[rocket-part]")


--------------------------------------------------------------------------------
----- Satellite                                                            -----
--------------------------------------------------------------------------------
LSlib.item.setSubgroup   ("item", "satellite", rocketGroup)
LSlib.item.setOrderstring("item", "satellite", "c[rocket-part]")
