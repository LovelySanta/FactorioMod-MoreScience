local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Science fluids                                                       -----
--------------------------------------------------------------------------------
for _,scienceFluid in pairs({
  string.format(scienceNames.red   , "fluid"),
  string.format(scienceNames.green , "fluid"),
  string.format(scienceNames.gray  , "fluid"),
  string.format(scienceNames.orange, "fluid"),
  string.format(scienceNames.cyan  , "fluid"),
  string.format(scienceNames.blue  , "fluid"),
  string.format(scienceNames.purple, "fluid"),
  string.format(scienceNames.yellow, "fluid"),
  string.format(scienceNames.pink  , "fluid"),
  string.format(scienceNames.white , "fluid"),
}) do
  local barrelName = scienceFluid.."-barrel"

  if data.raw["item"][barrelName] then -- Barrel item
    LSlib.item.setSubgroup     ("item", barrelName, "ms-science-barrel"                  )
    LSlib.item.setOrderstring  ("item", barrelName, data.raw["fluid"][scienceFluid].order)
    LSlib.item.setLocalisedName("item", barrelName, {"item-name.filled-barrel", data.raw["fluid"][scienceFluid].localised_name[2]})
  end

end
