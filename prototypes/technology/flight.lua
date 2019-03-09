local scienceNames    = require("prototypes/settings").scienceNames

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


-- construction robotics doesn't unlock logistics network
LSlib.technology.removeRecipeUnlock("construction-robotics", "roboport"                       )
LSlib.technology.removeRecipeUnlock("construction-robotics", "logistic-chest-storage"         )
LSlib.technology.removeRecipeUnlock("construction-robotics", "logistic-chest-passive-provider")

-- add prerequisites on this tech
LSlib.technology.addPrerequisite("robotics", flyTech.name)

--------------------------------------------------------------------------------
----- roboport                                                             -----
--------------------------------------------------------------------------------
local roboportTech = util.table.deepcopy(data.raw["technology"]["robotics"])
roboportTech.name = "roboports"

roboportTech.icon      = "__MoreScience__/graphics/technology/roboport-tech.png"
roboportTech.icon_size = 277
roboportTech.icons     = nil

roboportTech.prerequisites = {}
roboportTech.effects       = {}
data:extend{roboportTech}

-- prerequisites
LSlib.technology.addPrerequisite (roboportTech.name, "personal-roboport-equipment"           )
LSlib.technology.addPrerequisite (roboportTech.name, string.format(scienceNames.blue, "pack"))

-- move tech unlock from logistic-robotics
LSlib.technology.moveRecipeUnlock("logistic-robotics", roboportTech.name, "roboport"              )
LSlib.technology.moveRecipeUnlock("logistic-robotics", roboportTech.name, "logistic-chest-storage")

-- add prerequisites on this tech
LSlib.technology.addPrerequisite ("logistic-robotics"                                              , roboportTech.name)
LSlib.technology.movePrerequisite("worker-robots-speed-1", string.format(scienceNames.blue, "pack"), roboportTech.name)
LSlib.technology.addPrerequisite ("power-armor"                                                    , roboportTech.name)
