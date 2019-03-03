local settings = {}

--------------------------------------------------------------------------------
----- science names                                                        -----
--------------------------------------------------------------------------------
settings.scienceNames = {
  red    = "automation-science-%s"    ,
  green  = "logistic-science-%s"      ,
  gray   = "military-science-%s"      ,
  blue   = "chemical-science-%s"      ,
  purple = "production-science-%s"    ,
  yellow = "utility-science-%s"       ,
  white  = "space-science-%s"         ,

  cyan   = "electric-power-science-%s",
  orange = "advanced-%s"              ,
  pink   = "advanced-%s"              ,
}
settings.scienceNames.orange = string.format(settings.scienceNames.orange, settings.scienceNames.red  )
settings.scienceNames.pink   = string.format(settings.scienceNames.pink  , settings.scienceNames.green)

--------------------------------------------------------------------------------
----- science graphics                                                     -----
--------------------------------------------------------------------------------
settings.techIcons = {
  icon      = "__MoreScience__/graphics/technology/potions/",
  icon_size = 128
}

--------------------------------------------------------------------------------
----- science recipes                                                      -----
--------------------------------------------------------------------------------
settings.previousFluid = {
  [settings.scienceNames.red   ] = false                       ,
  [settings.scienceNames.green ] = settings.scienceNames.red   ,
  [settings.scienceNames.gray  ] = settings.scienceNames.red   ,
  [settings.scienceNames.blue  ] = settings.scienceNames.orange,
  [settings.scienceNames.purple] = settings.scienceNames.cyan  ,
  [settings.scienceNames.yellow] = settings.scienceNames.blue  ,

  [settings.scienceNames.orange] = settings.scienceNames.green ,
  [settings.scienceNames.cyan  ] = settings.scienceNames.green ,
}

settings.ingredientMultiplier = {
  [settings.scienceNames.red   ] = 5,
  [settings.scienceNames.green ] = 5,
  [settings.scienceNames.gray  ] = 5,
  [settings.scienceNames.blue  ] = 3,
  [settings.scienceNames.purple] = 3,
  [settings.scienceNames.yellow] = 3,

  [settings.scienceNames.orange] = 1,
  [settings.scienceNames.cyan  ] = 1,
}


return settings
