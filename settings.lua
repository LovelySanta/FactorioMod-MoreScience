
data:extend{
  { -- add more lamp colors
    type = "bool-setting",
    name = "MS-lamp-colors",
    setting_type = "startup",
    default_value = true,
    order = "MS-a[lamp-colors]",
  },

  { -- barrel stack size
    type = "int-setting",
    name = "MS-barrel-stack-size",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 15,
    order = "MS-b[barreling]-a[recycling]",
  },
  { -- allow barrel recycling recipe
    type = "bool-setting",
    name = "MS-allow-empty-barrel-recycling",
    setting_type = "startup",
    default_value = true,
    order = "MS-b[barreling]-a[recycling]",
  },

  { -- rocket lauching extended
    type = "bool-setting",
    name = "MS-rocket-launching-extended",
    setting_type = "startup",
    default_value = false,
    order = "MS-c[rocket]-a[extended]",
  },
}
