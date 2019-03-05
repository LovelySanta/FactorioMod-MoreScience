-- include library
require("lib/lib")
MoreScience.lib.debug.enable() -- enable logging to factorio-current.log

-- categories
categoryPath = "prototypes/categories/"
require(categoryPath .. "crafting-categories")
require(categoryPath .. "item-groups")

-- signals
signalPath = "prototypes/signal/"
require(signalPath .. "color-signal")

-- fluids
fluidPath = "prototypes/fluid/"
require(fluidPath .. "science-fluids")

-- items
itemPath = "prototypes/item/"
require(itemPath .. "research-labs")
require(itemPath .. "science-bottles")
require(itemPath .. "science-packs")
require(itemPath .. "assembling-machines")
require(itemPath .. "rocket-parts")
require(itemPath .. "rocket-payloads")
require(itemPath .. "rocket")

-- entities
entityPath = "prototypes/entity/"
require(entityPath .. "research-labs")
require(entityPath .. "assembling-machines")

-- recipes
recipePath = "prototypes/recipe/"
require(recipePath .. "research-labs")
require(recipePath .. "science-bottles")
require(recipePath .. "science-packs")
require(recipePath .. "science-fluids")
require(recipePath .. "assembling-machines")
require(recipePath .. "rocket-parts")
require(recipePath .. "rocket-payloads")
require(recipePath .. "rocket")

-- technology
technologyPath = "prototypes/technology/"
require(technologyPath .. "basic-automation")
require(technologyPath .. "fluid-handling")
require(technologyPath .. "military")
require(technologyPath .. "flight")

require(technologyPath .. "science-red")
require(technologyPath .. "science-green")
require(technologyPath .. "science-gray")
require(technologyPath .. "science-orange")
require(technologyPath .. "science-cyan")
require(technologyPath .. "science-blue")
require(technologyPath .. "science-purple")
require(technologyPath .. "science-yellow")
require(technologyPath .. "science-pink")
require(technologyPath .. "science-rocket")
require(technologyPath .. "science-white")
require(technologyPath .. "science-infused")
