if mods["Clowns-AngelBob-Nuclear"] then

  MoreScience.lib.technology.removeRecipeUnlock("rocketpart-fusion-reactor", "nuclear-fuel")
  MoreScience.lib.technology.movePrerequisite("rocketpart-fusion-reactor", "kovarex-enrichment-process", "nuclear-fuel-1")

end
