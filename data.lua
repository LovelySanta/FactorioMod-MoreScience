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
--require(fluidPath .. "")

-- items
itemPath = "prototypes/item/"
require(itemPath .. "research-labs")
require(itemPath .. "assembling-machines")

-- recipes
recipePath = "prototypes/recipe/"
require(recipePath .. "research-labs")
require(recipePath .. "assembling-machines")

-- technology
technologyPath = "prototypes/technology/"
require(technologyPath .. "basic-automation")
require(technologyPath .. "assembling-machines")
