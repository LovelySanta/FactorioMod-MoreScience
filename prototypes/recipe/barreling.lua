
if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
  local barrelRecycling = util.table.deepcopy(data.raw["recipe"]["empty-barrel"])
  barrelRecycling.name = barrelRecycling.name .. "-recycling"
  barrelRecycling.category = "smelting"
  barrelRecycling.energy_required = 16
  barrelRecycling.ingredients = util.table.deepcopy(barrelRecycling.results)
  barrelRecycling.results = {{type="item", name="steel-plate", amount=1, probability=.8}}
  data:extend{barrelRecycling}
end
