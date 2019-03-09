-- Make sure this part of the library exists
if not MoreScience.lib.table then MoreScience.lib.table = {} end



function MoreScience.lib.table.hasValue(table, value)
  for _,val in pairs(table) do
    if value == val then
      return true
    end
  end

  return false
end



function MoreScience.lib.table.isTable(t)
  return type(t) == "table"
end



function MoreScience.lib.table.isEmpty(t)
  return not next(t)
end



function MoreScience.lib.table.areEqual(t1, t2)
  if (not MoreScience.lib.table.isTable(t1)) or
     (not MoreScience.lib.table.isTable(t2)) then
    return t1 == t2
  end
  for k,v in pairs(t1) do
    if not lib.table.areEqual(v, t2[k]) then
      return false
    end
  end
  for k,v in pairs(t2) do
    if not (t1[k] ~= nil) then
      return false
    end
  end
  return true
end
