--------------------------------------------------------------------------------
----- flight                                                               -----
--------------------------------------------------------------------------------
local flyTech = util.table.deepcopy(data.raw["technology"]["robotics"])
flyTech.name = "flight"

flyTech.icon = "__MoreScience__/graphics/technology/flying-tech.png"
flyTech.icon_size = 128
flyTech.icons = nil

flyTech.prerequisites = {}
flyTech.effects       = {}
data:extend{flyTech}

MoreScience.lib.technology.addPrerequisite("robotics", flyTech.name)


-- construction robotics doesn't unlock logistics network
MoreScience.lib.technology.removeRecipeUnlock("construction-robotics", "roboport")
MoreScience.lib.technology.removeRecipeUnlock("construction-robotics", "logistic-chest-storage")
MoreScience.lib.technology.removeRecipeUnlock("construction-robotics", "logistic-chest-passive-provider")
