local var = Tracker.ActiveVariantUID
local chaos = var:find('chaos')

if chaos then
  Tracker:AddItems("var_chaos/items/items.json")
else
  Tracker:AddItems("items/items.json")
end


Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/layouts.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

if PopVersion and PopVersion >= "0.18.0" then
  ScriptHost:LoadScript("scripts/autotracking.lua")
end