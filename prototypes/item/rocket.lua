local rocket      = require ("prototypes/settings").rocket
local rocketGroup = "ms-science-" .. rocket.subgroup

--------------------------------------------------------------------------------
----- Rocket-silo                                                          -----
--------------------------------------------------------------------------------
MoreScience.lib.item.setSubgroup   ("item", "rocket-silo", rocketGroup)
MoreScience.lib.item.setOrderstring("item", "rocket-silo", "a[rocket-silo]")


--------------------------------------------------------------------------------
----- Rocket-MK1                                                           -----
--------------------------------------------------------------------------------
MoreScience.lib.item.changeIcon    ("item", "rocket-part", "__MoreScience__/graphics/technology/rocket-tech.png", 250)
MoreScience.lib.item.setSubgroup   ("item", "rocket-part", rocketGroup)
MoreScience.lib.item.setOrderstring("item", "rocket-part", "b[rocket-part]")


--------------------------------------------------------------------------------
----- Satellite                                                            -----
--------------------------------------------------------------------------------
MoreScience.lib.item.setSubgroup   ("item", "satellite", rocketGroup)
MoreScience.lib.item.setOrderstring("item", "satellite", "c[rocket-part]")
