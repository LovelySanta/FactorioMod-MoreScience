if mods["logicarts"] then

  MoreScience.lib.technology.movePrerequisite("logicarts-tech1", "engine", "automobilism")
  for _, techName in pairs({
    "logicarts-tech1",
    "logicarts-tech2",
    "logicarts-tech-stops",
    "logicarts-tech-stickers",
    "logicarts-tech-groups",
    "logicarts-tech-dual",
  }) do
    MoreScience.lib.technology.addIngredient(techName, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("logicarts-tech2", 1, "basic-power-science-pack")

end
