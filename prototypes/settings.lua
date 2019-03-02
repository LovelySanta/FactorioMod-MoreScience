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
-- TODO


return settings
