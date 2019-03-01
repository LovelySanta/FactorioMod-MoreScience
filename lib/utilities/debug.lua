
Debug = {}

Debug.enabled = true
Debug.returnValue = 5

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

  researchTechnology("automated-rail-transportation")
  researchTechnology("rail-signals")
  researchTechnology("braking-force-1")

  researchTechnology("oil-processing")
  researchTechnology("fluid-handling-2")
  researchTechnology("lubricant")

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
  researchTechnology("braking-force-2")

  researchTechnology("battery")
  researchTechnology("electric-energy-accumulators-1")
  researchTechnology("electric-engine")

  researchTechnology("flight")
  researchTechnology("robotics")
  researchTechnology("construction-robotics")

  researchTechnology("combat-robotics")

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

end
