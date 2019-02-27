
Debug = {}

Debug.enabled = true
Debug.returnValue = 3

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
  researchTechnology("advanced-material-processing")
  researchTechnology("concrete")
  researchTechnology("landfill")

  researchTechnology("engine")
  researchTechnology("logistics-2")
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

  researchTechnology("weapon-shooting-speed-3")
  researchTechnology("physical-projectile-damage-3")
  researchTechnology("stronger-explosives-2")

  if self.returnValue == 3 then
    return
  end

end
