local unitName = "lootboxnano_t1_var4"

local nanoDefCreator= VFS.Include("unitbasedefs/lootboxes/lootboxnano.lua")
local tiers = nanoDefCreator.Tiers
local unitDef = nanoDefCreator.CreateNanoUnitDef(tiers.T1)

return lowerkeys({ [unitName] = unitDef })