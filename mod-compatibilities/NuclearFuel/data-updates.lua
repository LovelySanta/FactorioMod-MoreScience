if mods["Nuclear Fuel"] then

  if data.raw["technology"]["kovarex-enrichment-process"] and data.raw["technology"]["kovarex-enrichment-process"].effects then
    local fuelEffect = false
    for _, effect in pairs(data.raw["technology"]["kovarex-enrichment-process"].effects) do
      if effect and effect.type == "unlock-recipe" then
        if effect.recipe == "nuclear-fuel" then
          fuelEffect = true
        end
      end
    end
    if not fuelEffect then
      -- add nuclear fuel unlock
      MoreScience.lib.technology.removeRecipeUnlock("rocket-silo", "nuclear-fuel")
      MoreScience.lib.technology.addRecipeUnlock("nuclear-power", "nuclear-fuel")

      -- add nuclear fuel from plutonium
      local plutoniumFuel = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel"])
      plutoniumFuel.name = "plutonium-fuel"
      data:extend({plutoniumFuel})
      MoreScience.lib.recipe.editIngredient("plutonium-fuel", "uranium-235", "plutonium", 1)
      MoreScience.lib.technology.addRecipeUnlock("kovarex-enrichment-process", "plutonium-fuel")

      -- add dependency on obtaining plutonium before making fuel out of it
      MoreScience.lib.technology.addPrerequisite("kovarex-enrichment-process", "nuclear-fuel-reprocessing")
    end
  end

end
