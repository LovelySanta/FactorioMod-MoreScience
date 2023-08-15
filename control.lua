require "src/debug"

local updateDiscoScience = function()
    if Debug.enabled then
        Debug:reseachAllTechnologies()
    end
    if remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setLabScale"] then
        remote.call("DiscoScience", "setLabScale", "lab-mk0", 1)
        remote.call("DiscoScience", "setLabScale", "lab-mk2", 1)
    end
end

script.on_configuration_changed(
    function ()
        updateDiscoScience()
    end
)

-- on load game for first time
script.on_init(
    function ()
        updateDiscoScience()
    end
)
