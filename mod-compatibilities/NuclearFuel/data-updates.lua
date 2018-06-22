if mods["Nuclear Fuel"] then
  if data.raw["technology"]["kovarex-enrichment-process"] and data.raw["technology"]["kovarex-enrichment-process"].effects then
    local enrichmentEffect = false
    local fuelEffect = false
    for _, effect in pairs(data.raw["technology"]["kovarex-enrichment-process"].effects) do
      if effect and effect.type == "unlock-recipe" then
        if effect.recipe == "kovarex-enrichment-process" then
          enrichmentEffect = true
        elseif effect.recipe == "nuclear-fuel" then
          fuelEffect = true
        end
      end
    end
    if not enrichmentEffect then
      --MoreScience.lib.technology.addRecipeUnlock("kovarex-enrichment-process", "kovarex-enrichment-process")
    end
    if not fuelEffect then
      MoreScience.lib.technology.removeRecipeUnlock("rocket-silo", "nuclear-fuel")
      MoreScience.lib.technology.addRecipeUnlock("nuclear-power", "nuclear-fuel")

      -- add nuclear fuel from plutonium
      local plutoniumFuel = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel"])
      plutoniumFuel.name = "plutonium-fuel"
      data:extend({plutoniumFuel})
      MoreScience.lib.recipe.editIngredient("plutonium-fuel", "uranium-235", "plutonium", 1)
      MoreScience.lib.technology.addRecipeUnlock("kovarex-enrichment-process", "plutonium-fuel")
    end
  end

  log(serpent.block(data.raw["technology"]["kovarex-enrichment-process"]))
end
