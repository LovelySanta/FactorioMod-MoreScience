-- include library
require("lib/lib")
MoreScience.lib.debug.enable() -- enable logging to factorio-current.log

-- categories
categoryPath = "prototypes/categories/"
require(categoryPath .. "crafting-categories")
require(categoryPath .. "item-groups")

-- signals
signalPath = "prototypes/signal/"
--require(signalPath .. "")

-- entities
entityPath = "prototypes/entity/"
require(entityPath .. "research-labs")
require(entityPath .. "assembling-machines")

-- fluids
fluidPath = "prototypes/fluid/"
require(fluidPath .. "science-fluids")

-- items
itemPath = "prototypes/item/"
require(itemPath .. "research-labs")
require(itemPath .. "science-fluids-bottling")
require(itemPath .. "assembling-machines")

-- recipes
recipePath = "prototypes/recipe/"
require(recipePath .. "research-labs")
require(recipePath .. "science-fluids-bottling")
require(recipePath .. "assembling-machines")

-- technology
technologyPath = "prototypes/technology/"
require(technologyPath .. "basic-automation")
require(technologyPath .. "fluid-handling")
require(technologyPath .. "science-fluids-bottling")
require(technologyPath .. "assembling-machines")
