local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Purified water                                                       -----
--------------------------------------------------------------------------------
if data.raw["item"]["purified-water-barrel"] then
  for _,barreling in pairs({
    "fill",  -- Filling barrel recipe
    "empty", -- Empty barrel recipe
  }) do
    if data.raw["recipe"][barreling.."-purified-water-barrel"] then
      data.raw["recipe"][barreling.."-purified-water-barrel"].subgroup = data.raw["fluid"]["purified-water"].subgroup
      data.raw["recipe"][barreling.."-purified-water-barrel"].order = data.raw["fluid"]["purified-water"].order
    end
  end
end

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
    for _,barreling in pairs({
      "fill",  -- Filling barrel recipe
      "empty", -- Empty barrel recipe
    }) do
      if data.raw["recipe"][barreling.."-"..barrelName] then
        LSlib.recipe.setSubgroup     (barreling.."-"..barrelName, data.raw["item"][barrelName].subgroup.."-"..barreling)
        LSlib.recipe.setOrderstring  (barreling.."-"..barrelName, data.raw["fluid"][scienceFluid].order)
        LSlib.recipe.setLocalisedName(barreling.."-"..barrelName, {"recipe-name."..barreling..(barreling=="empty" and "-filled" or "").."-barrel", data.raw["fluid"][scienceFluid].localised_name[2]})
      end
    end
  end

end
