-- include library
require("lib/lib")
MoreScience.lib.debug.enable() -- enable logging to factorio-current.log

-- categories
categoryPath = "prototypes/categories/"
require(categoryPath .. "crafting-categories")
require(categoryPath .. "item-groups")

-- entities
entityPath = "prototypes/entity/"
require(entityPath .. "assembling-machines")

-- fluids
fluidPath = "prototypes/fluid/"
--require(fluidPath .. "")

-- items
itemPath = "prototypes/item/"
require(itemPath .. "assembling-machines")

-- signals
signalPath = "prototypes/signal/"
--require(signalPath .. "")

-- recipes
recipePath = "prototypes/recipe/"
require(recipePath .. "assembling-machines")

-- technology
technologyPath = "prototypes/technology/"
require(technologyPath .. "assembling-machines")
