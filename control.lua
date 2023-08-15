require "src/debug"

local scienceNames = require("prototypes/settings").scienceNames

local updateDiscoScience = function()
    if Debug.enabled then
        Debug:reseachAllTechnologies()
    end
    if remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setLabScale"] then
        remote.call("DiscoScience", "setLabScale", "lab-mk0", 1)
        remote.call("DiscoScience", "setLabScale", "lab-mk2", 1)
    end
    if remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setIngredientColor"] then
        -- Colours from the fluid defined in prototypes/fluid/science-fluids.lua
        for _,scienceName in pairs(scienceNames) do
                remote.call("DiscoScience", "setIngredientColor", string.format(scienceName, "pack"), game.fluid_prototypes[string.format(scienceName, "fluid")].base_color)
                remote.call("DiscoScience", "setIngredientColor", "infused-"..string.format(scienceName, "pack"), game.fluid_prototypes[string.format(scienceName, "fluid")].base_color)
        end
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
