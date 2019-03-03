
Debug = {}

Debug.enabled = true
Debug.returnValue = 7

function Debug:reseachAllTechnologies()
  force = game.forces["player"]

  local function researchTechnology(technologyName)
    local function reportFail(technologyName)
      log("WARNING: Could not research " .. technologyName)
      return false
    end

    if force.technologies[technologyName] and force.technologies[technologyName].enabled then
      -- check prerequisites
      for _,prerequisite in pairs(force.technologies[technologyName].prerequisites) do
        if not prerequisite.researched then
          return reportFail(technologyName)
        end
      end
      -- do the research
      force.technologies[technologyName].researched = true
      return true
    end
    return reportFail(technologyName)
  end


--------------------------------------------------------------------------------
----- Red science                                                          -----
--------------------------------------------------------------------------------

  researchTechnology("basic-automation")
  researchTechnology("steel-processing")
  researchTechnology("brick-processing")

  researchTechnology("automation")
  researchTechnology("electronics")

  researchTechnology("logistics")
  researchTechnology("fast-inserter")
  researchTechnology("optics")

  researchTechnology("military")
  researchTechnology("stone-walls")
  researchTechnology("turrets")
  researchTechnology("heavy-armor")
  researchTechnology("weapon-shooting-speed-1")
  researchTechnology("physical-projectile-damage-1")

  researchTechnology("fluid-handling")
  researchTechnology("purification-research")
  researchTechnology("bottling-research")
  researchTechnology("research-speed-1")

  researchTechnology("logistic-science-pack")

  if self.returnValue == 1 then
    return
  end

--------------------------------------------------------------------------------
----- Green science                                                        -----
--------------------------------------------------------------------------------

  researchTechnology("automation-2")
  researchTechnology("toolbelt")
  researchTechnology("steel-axe")
  researchTechnology("circuit-network")
  researchTechnology("solar-energy")
  researchTechnology("advanced-material-processing")
  researchTechnology("concrete")
  researchTechnology("landfill")

  researchTechnology("engine")
  researchTechnology("logistics-2")
  researchTechnology("inserter-capacity-bonus-1")
  researchTechnology("automobilism")
  researchTechnology("railway")

  researchTechnology("research-speed-2")
  researchTechnology("electric-energy-distribution-1")

  researchTechnology("military-2")
  researchTechnology("gates")
  researchTechnology("weapon-shooting-speed-2")
  researchTechnology("physical-projectile-damage-2")
  researchTechnology("stronger-explosives-1")


  if self.returnValue == 2 then
    return
  end

--------------------------------------------------------------------------------
----- Gray science                                                         -----
--------------------------------------------------------------------------------

  researchTechnology("military-science-pack")

  researchTechnology("physical-projectile-damage-3")
  researchTechnology("stronger-explosives-2")

  if self.returnValue == 3 then
    return
  end

--------------------------------------------------------------------------------
----- Orange science                                                       -----
--------------------------------------------------------------------------------

  researchTechnology("advanced-automation-science-pack")

  researchTechnology("oil-processing")
  researchTechnology("fluid-handling-2")
  researchTechnology("lubricant")

  researchTechnology("automated-rail-transportation")
  researchTechnology("rail-signals")
  researchTechnology("braking-force-1")
  researchTechnology("braking-force-2")

  researchTechnology("sulfur")
  researchTechnology("explosives")
  researchTechnology("cliff-explosives")
  researchTechnology("sulfur-processing")

  researchTechnology("plastics")
  researchTechnology("advanced-electronics")
  researchTechnology("stack-inserter")
  researchTechnology("inserter-capacity-bonus-2")

  researchTechnology("modules")
  researchTechnology("productivity-module")
  researchTechnology("speed-module")
  researchTechnology("effectivity-module")

  researchTechnology("flammables")
  researchTechnology("rocket-fuel")
  researchTechnology("rocketry")
  researchTechnology("weapon-shooting-speed-3")
  researchTechnology("weapon-shooting-speed-4")
  researchTechnology("physical-projectile-damage-3")
  researchTechnology("physical-projectile-damage-4")

  researchTechnology("land-mine")
  researchTechnology("stronger-explosives-3")
  researchTechnology("stronger-explosives-4")

  researchTechnology("flamethrower")
  researchTechnology("refined-flammables-1")
  researchTechnology("refined-flammables-2")

  if self.returnValue == 4 then
    return
  end

--------------------------------------------------------------------------------
----- Cyan science                                                         -----
--------------------------------------------------------------------------------

  researchTechnology("electric-power-science-pack")
  researchTechnology("research-speed-3")

  researchTechnology("mining-productivity-1")
  researchTechnology("braking-force-3")

  researchTechnology("battery")
  researchTechnology("electric-energy-accumulators-1")
  researchTechnology("electric-engine")

  researchTechnology("flight")
  researchTechnology("robotics")
  researchTechnology("construction-robotics")

  researchTechnology("combat-robotics")
  researchTechnology("follower-robot-count-1")
  researchTechnology("follower-robot-count-2")

  researchTechnology("laser")
  researchTechnology("laser-turrets")
  researchTechnology("energy-weapons-damage-1")
  researchTechnology("energy-weapons-damage-2")
  researchTechnology("energy-weapons-damage-3")
  researchTechnology("laser-turret-speed-1")
  researchTechnology("laser-turret-speed-2")

  researchTechnology("modular-armor")
  researchTechnology("solar-panel-equipment")
  researchTechnology("battery-equipment")
  researchTechnology("belt-immunity-equipment")
  researchTechnology("night-vision-equipment")
  researchTechnology("personal-roboport-equipment")
  researchTechnology("energy-shield-equipment")

  if self.returnValue == 5 then
    return
  end

--------------------------------------------------------------------------------
----- Blue science                                                         -----
--------------------------------------------------------------------------------

  researchTechnology("chemical-science-pack")
  researchTechnology("research-speed-4")

  researchTechnology("mining-productivity-4")
  researchTechnology("fluid-handling-3")
  researchTechnology("fluid-wagon")
  researchTechnology("braking-force-4")

  researchTechnology("advanced-oil-processing")
  researchTechnology("advanced-material-processing-2")
  researchTechnology("concrete-2")

  researchTechnology("electric-energy-distribution-2")
  researchTechnology("uranium-processing")
  researchTechnology("nuclear-power")

  researchTechnology("advanced-electronics-2")
  researchTechnology("productivity-module-2")
  researchTechnology("speed-module-2")
  researchTechnology("effectivity-module-2")

  researchTechnology("inserter-capacity-bonus-3")
  researchTechnology("inserter-capacity-bonus-4")

  researchTechnology("military-3")
  researchTechnology("refined-flammables-3")

  researchTechnology("explosive-rocketry")
  researchTechnology("stronger-explosives-5")

  researchTechnology("tanks")
  researchTechnology("weapon-shooting-speed-5")
  researchTechnology("physical-projectile-damage-5")

  researchTechnology("combat-robotics-2")
  researchTechnology("follower-robot-count-3")
  researchTechnology("follower-robot-count-4")
  researchTechnology("energy-weapons-damage-4")
  researchTechnology("laser-turret-speed-3")
  researchTechnology("laser-turret-speed-4")

  researchTechnology("low-density-structure")
  researchTechnology("roboports")
  researchTechnology("logistic-robotics")
  researchTechnology("worker-robots-storage-1")
  researchTechnology("worker-robots-speed-1")
  researchTechnology("worker-robots-speed-2")
  researchTechnology("character-logistic-slots-1")
  researchTechnology("character-logistic-slots-2")
  researchTechnology("character-logistic-slots-3")
  researchTechnology("character-logistic-trash-slots-1")
  researchTechnology("character-logistic-trash-slots-2")
  researchTechnology("auto-character-logistic-trash-slots")

  researchTechnology("power-armor")
  researchTechnology("energy-shield-mk2-equipment")
  researchTechnology("discharge-defense-equipment")
  researchTechnology("personal-laser-defense-equipment")
  researchTechnology("exoskeleton-equipment")
  researchTechnology("battery-mk2-equipment")

  if self.returnValue == 6 then
    return
  end

--------------------------------------------------------------------------------
----- Purple science                                                       -----
--------------------------------------------------------------------------------

  researchTechnology("production-science-pack")
  researchTechnology("mining-productivity-8")

  researchTechnology("coal-liquefaction")
  researchTechnology("nuclear-fuel-reprocessing")
  researchTechnology("kovarex-enrichment-process")

  researchTechnology("effectivity-module-3")
  researchTechnology("effect-transmission")
  researchTechnology("productivity-module-3")
  researchTechnology("speed-module-3")

  researchTechnology("logistics-3")
  researchTechnology("braking-force-5")
  researchTechnology("inserter-capacity-bonus-5")
  researchTechnology("inserter-capacity-bonus-6")
  researchTechnology("worker-robots-storage-2")

  researchTechnology("automation-3")
  researchTechnology("research-speed-5")

  if self.returnValue == 7 then
    return
  end

end
