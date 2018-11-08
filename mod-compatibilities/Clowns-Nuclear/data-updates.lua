if mods["Clowns-Nuclear"] then

  MoreScience.lib.technology.addRecipeUnlock("rocketpart-fusion-reactor", "nuclear-fuel")

end

-- mod compatibility with bob angel extension
require "mod-compatibilities.Clowns-Nuclear.Clowns-AngelBob-Nuclear.data-updates"
