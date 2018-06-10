
--------------------------------------------------------------------------------
----- Military                                                             -----
--------------------------------------------------------------------------------
MoreScience.lib.recipe.disable("light-armor")
MoreScience.lib.technology.addRecipeUnlock("military", "light-armor")
MoreScience.lib.technology.addPrerequisite("turrets", "military")
MoreScience.lib.technology.addPrerequisite("stone-walls", "military")



--------------------------------------------------------------------------------
----- Military-2: require green science                                    -----
--------------------------------------------------------------------------------
-- add science dependency
MoreScience.lib.technology.addPrerequisite("military-2", "basic-science-research-1")

-- add other dependencies on military-2
MoreScience.lib.technology.addPrerequisite("modular-armor", "military-2")

-- bonusses requiring green science now require military-2
MoreScience.lib.technology.addPrerequisite("bullet-damage-2", "military-2")
MoreScience.lib.technology.addPrerequisite("bullet-speed-2", "military-2")
MoreScience.lib.technology.addPrerequisite("gun-turret-damage-1", "military-2")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-damage-2", "military-2")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-speed-2", "military-2")


--------------------------------------------------------------------------------
----- Basic military science pack (gray science)                           -----
--------------------------------------------------------------------------------
-- remove recipe unlock from other technologies
MoreScience.lib.technology.removeRecipeUnlock("military-2", "military-science-pack")

-- create research for recipes
data:extend({
  {
    type = "technology",
    name = "basic-military-science-research",
    icon = "__MoreScience__/graphics/technology/science-symbol.png",
    icon_size = 2000,
    prerequisites = {
      "basic-science-research-1",
      "turrets",
      "military-2",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-military-science-fluid"
      },
      {
        type = "unlock-recipe",
        recipe = "military-science-pack"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 3},
      },
      time = 5
    },
    order = "c-a"
  },
})
MoreScience.lib.technology.addPrerequisite("bullet-damage-3", "basic-military-science-research")
MoreScience.lib.technology.addPrerequisite("bullet-speed-4", "basic-military-science-research")
MoreScience.lib.technology.addPrerequisite("gun-turret-damage-3", "basic-military-science-research")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-damage-3", "basic-military-science-research")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-speed-4", "basic-military-science-research")

-- requiring military science instead of military-2
MoreScience.lib.technology.removePrerequisite("laser-turrets", "military-2")
MoreScience.lib.technology.addPrerequisite("laser-turrets", "basic-military-science-research")
MoreScience.lib.technology.removePrerequisite("flamethrower", "military-2")
MoreScience.lib.technology.addPrerequisite("flamethrower", "basic-military-science-research")
MoreScience.lib.technology.removePrerequisite("combat-robotics", "military-2")
MoreScience.lib.technology.addPrerequisite("combat-robotics", "basic-military-science-research")
MoreScience.lib.technology.removePrerequisite("rocketry", "military-2")
MoreScience.lib.technology.addPrerequisite("rocketry", "basic-military-science-research")
MoreScience.lib.technology.removePrerequisite("explosives", "military-2")
MoreScience.lib.technology.addPrerequisite("explosives", "basic-military-science-research")
MoreScience.lib.technology.removePrerequisite("grenade-damage-1", "military-2")
MoreScience.lib.technology.addPrerequisite("grenade-damage-1", "basic-military-science-research")
--MoreScience.lib.technology.removePrerequisite("military-3", "military-2")
MoreScience.lib.technology.addPrerequisite("military-3", "basic-military-science-research")



--------------------------------------------------------------------------------
----- Military-3: require blue science                                     -----
--------------------------------------------------------------------------------
-- add science dependency
MoreScience.lib.technology.addPrerequisite("military-3", "basic-science-research-2")

-- armor equipment
MoreScience.lib.technology.addPrerequisite("energy-shield-mk2-equipment", "military-3")
MoreScience.lib.technology.addPrerequisite("personal-laser-defense-equipment", "military-3")
MoreScience.lib.technology.addPrerequisite("discharge-defense-equipment", "military-3")
MoreScience.lib.technology.addPrerequisite("power-armor", "military-3")

-- bonusses requiring blue science now require military-3
MoreScience.lib.technology.addPrerequisite("bullet-damage-5", "military-3")
MoreScience.lib.technology.addPrerequisite("bullet-speed-5", "military-3")
MoreScience.lib.technology.addPrerequisite("gun-turret-damage-5", "military-3")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-damage-5", "military-3")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-speed-5", "military-3")
MoreScience.lib.technology.addPrerequisite("grenade-damage-4", "military-3")
MoreScience.lib.technology.addPrerequisite("flamethrower-damage-3", "military-3")
MoreScience.lib.technology.addPrerequisite("laser-turret-damage-3", "military-3")
MoreScience.lib.technology.addPrerequisite("laser-turret-speed-3", "military-3")
MoreScience.lib.technology.addPrerequisite("rocket-damage-3", "military-3")
MoreScience.lib.technology.addPrerequisite("rocket-speed-3", "military-3")

MoreScience.lib.technology.addPrerequisite("combat-robot-damage-3", "combat-robotics-2")
MoreScience.lib.technology.addPrerequisite("follower-robot-count-3", "combat-robotics-2")



--------------------------------------------------------------------------------
----- Military-4: require yellow science                                   -----
--------------------------------------------------------------------------------
-- add science dependency
MoreScience.lib.technology.addPrerequisite("military-4", "advanced-science-research-2")
-- add other dependencies
MoreScience.lib.technology.addPrerequisite("military-4", "explosives")

-- armor equipment
MoreScience.lib.technology.addPrerequisite("fusion-reactor-equipment", "military-4")
MoreScience.lib.technology.addPrerequisite("personal-roboport-equipment-2", "military-4")
MoreScience.lib.technology.addPrerequisite("power-armor-2", "military-4")

-- bonusses requiring yellow science now require military-4
MoreScience.lib.technology.addPrerequisite("bullet-damage-6", "military-4")
MoreScience.lib.technology.addPrerequisite("bullet-speed-6", "military-4")
MoreScience.lib.technology.addPrerequisite("gun-turret-damage-6", "military-4")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-damage-6", "military-4")
MoreScience.lib.technology.addPrerequisite("shotgun-shell-speed-6", "military-4")
MoreScience.lib.technology.addPrerequisite("grenade-damage-6", "military-4")
MoreScience.lib.technology.addPrerequisite("flamethrower-damage-5", "military-4")
MoreScience.lib.technology.addPrerequisite("laser-turret-damage-5", "military-4")
MoreScience.lib.technology.addPrerequisite("laser-turret-speed-5", "military-4")
MoreScience.lib.technology.addPrerequisite("rocket-damage-6", "military-4")
MoreScience.lib.technology.addPrerequisite("rocket-speed-6", "military-4")
MoreScience.lib.technology.addPrerequisite("cannon-shell-damage-4", "military-4")
MoreScience.lib.technology.addPrerequisite("cannon-shell-speed-4", "military-4")

MoreScience.lib.technology.addPrerequisite("combat-robot-damage-5", "combat-robotics-3")
