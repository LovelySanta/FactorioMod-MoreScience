require "util"

-- science pack
data.raw["item-subgroup"]["science-pack"].group = "ms-science"

-- science bottling
local scienceRawMaterial = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
scienceRawMaterial.name = "science-raw-material"
scienceRawMaterial.order = scienceRawMaterial.order .. "-a-a"

-- science bottling
local scienceBottling = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
scienceBottling.name = "science-bottling"
scienceBottling.order = scienceBottling.order .. "-a-b"

-- science fluid
local scienceFluid = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
scienceFluid.name = "science-fluid"
scienceFluid.order = scienceFluid.order .. "-b-a"

-- science fluid barreling
local scienceBarrel = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
scienceBarrel.name = "science-barrel"
scienceBarrel.order = scienceBarrel.order .. "-b-b"
local scienceBarrelFill = util.table.deepcopy(scienceBarrel)
scienceBarrelFill.name = scienceBarrelFill.name .. "-fill"
scienceBarrelFill.order = scienceBarrelFill.order .. "[fill]"
local scienceBarrelEmpty = util.table.deepcopy(scienceBarrel)
scienceBarrelEmpty.name = scienceBarrelEmpty.name .. "-empty"
scienceBarrelEmpty.order = scienceBarrelEmpty.order .. "[empty]"

-- infused science pack
local infusedSciencePack = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
infusedSciencePack.name = "infused-science-pack"
infusedSciencePack.order = infusedSciencePack.order .. "-c-b"

-- rocket parts
local rocketParts = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
rocketParts.name = "rocket-parts"
rocketParts.order = rocketParts.order .. "-d-a"

-- rocket assembly
local rocketAssembly = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
rocketAssembly.name = "rocket-assembly"
rocketAssembly.order = rocketAssembly.order .. "-d-b"

-- science pack subgroup
data.raw["item-subgroup"]["science-pack"].order = data.raw["item-subgroup"]["science-pack"].order .. "-c-a"



data:extend({
  scienceRawMaterial,
  scienceBottling,

  scienceFluid,
  scienceBarrel,
  scienceBarrelFill,
  scienceBarrelEmpty,

  -- sciencePack, -- vanilla
  infusedSciencePack,

  rocketParts,
  rocketAssembly,
})
