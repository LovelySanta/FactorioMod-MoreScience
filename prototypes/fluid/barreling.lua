
--------------------------------------------------------------------------------
----- ¨Purified water                                                       -----
--------------------------------------------------------------------------------
if data.raw["item"]["purified-water-barrel"] then
  data.raw["item"]["purified-water-barrel"].subgroup = "science-raw-material"
  data.raw["item"]["purified-water-barrel"].order = data.raw["fluid"]["purified-water"].order

  for _,barreling in pairs({
    "fill",  -- Filling barrel recipe
    "empty", -- Empty barrel recipe
  }) do
    if data.raw["recipe"][barreling.."-purified-water-barrel"] then
      data.raw["recipe"][barreling.."-purified-water-barrel"].subgroup = "science-raw-material"
      data.raw["recipe"][barreling.."-purified-water-barrel"].order = data.raw["fluid"]["purified-water"].order

      MoreScience.lib.technology.removeRecipeUnlock("fluid-handling", barreling.."-purified-water-barrel")
      MoreScience.lib.technology.addRecipeUnlock("fluid-handling-3", barreling.."-purified-water-barrel")
    end
  end
end

--------------------------------------------------------------------------------
----- Oil fluids                                                           -----
--------------------------------------------------------------------------------
for _,oilFluid in pairs({
  "crude-oil",
  "petroleum-gas",
  "light-oil",
  "heavy-oil",
  "lubricant",
  "sulfuric-acid",
}) do
  -- Filling barrel recipe
  if data.raw["recipe"]["fill-"..oilFluid.."-barrel"] then
    MoreScience.lib.technology.removeRecipeUnlock("fluid-handling", "fill-"..oilFluid.."-barrel")
    MoreScience.lib.technology.addRecipeUnlock("fluid-handling-2", "fill-"..oilFluid.."-barrel")
  end

  -- Empty barrel recipe
  if data.raw["recipe"]["empty-"..oilFluid.."-barrel"] then
    MoreScience.lib.technology.removeRecipeUnlock("fluid-handling", "empty-"..oilFluid.."-barrel")
    MoreScience.lib.technology.addRecipeUnlock("fluid-handling-2", "empty-"..oilFluid.."-barrel")
  end
end

--------------------------------------------------------------------------------
----- Science fluids                                                       -----
--------------------------------------------------------------------------------
for _,scienceFluid in pairs({
  "basic-science-fluid-1",
  "basic-science-fluid-2",
  "basic-science-fluid-3",
  "advanced-science-fluid-1",
  "advanced-science-fluid-2",
  "extreme-science-fluid",
  "basic-military-science-fluid",
  "basic-automation-science-fluid",
  "basic-power-science-fluid",
  "basic-logistics-science-fluid",
}) do
  local barrelName = scienceFluid.."-barrel"

  if data.raw["item"][barrelName] then -- Barrel item
    data.raw["item"][barrelName].subgroup = "science-barrel"
    data.raw["item"][barrelName].order = data.raw["fluid"][scienceFluid].order

    for _,barreling in pairs({
      "fill",  -- Filling barrel recipe
      "empty", -- Empty barrel recipe
    }) do
      if data.raw["recipe"][barreling.."-"..barrelName] then
        data.raw["recipe"][barreling.."-"..barrelName].subgroup = "science-barrel-"..barreling
        data.raw["recipe"][barreling.."-"..barrelName].order = data.raw["fluid"][scienceFluid].order

        MoreScience.lib.technology.removeRecipeUnlock("fluid-handling", barreling.."-"..barrelName)
        MoreScience.lib.technology.addRecipeUnlock("fluid-handling-3", barreling.."-"..barrelName)
      end
    end
  end

end
