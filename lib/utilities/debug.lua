
Debug = {}

Debug.enabled = false
Debug.returnValue = 1

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

  -- Automation & Logistics: smelter setup
  researchTechnology("basic-automation")

  if self.returnValue == 1 then
    return
  end

end
