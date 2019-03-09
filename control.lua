require "src/debug"

if Debug.enabled then
  -- on load game for first time
  script.on_init(function(_)
      Debug:reseachAllTechnologies()
  end)
end
