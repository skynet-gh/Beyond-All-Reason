-------------------------------------------------------------------------------
--           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
--                   Version 2, December 2004
--
--Copyright (C) 2009 BrainDamage
--Everyone is permitted to copy and distribute verbatim or modified
--copies of this license document, and changing it is allowed as long
--as the name is changed.
--
--           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
--  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
--
-- 0. You just DO WHAT THE FUCK YOU WANT TO.
-------------------------------------------------------------------------------

local MaxStockpile = 100 -- set this to desired stockpile levels

function widget:GetInfo()
  return {
    name      = "Stockpiler (dynamic)",
    desc      = "keeps stockpiled units at max " .. MaxStockpile .. " in storage",
    author    = "BD",
    date      = "tomorrow",
    license   = "WTFPL",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

local GetTeamUnits 		= Spring.GetTeamUnits
local GetMyTeamID		= Spring.GetMyTeamID
local SetUnitGroup		= Spring.SetUnitGroup
local GetSpectatingState= Spring.GetSpectatingState
local GetUnitDefID 		= Spring.GetUnitDefID
local GetUnitStockpile	= Spring.GetUnitStockpile
local GiveOrderToUnit	= Spring.GiveOrderToUnit

local myTeamID = Spring.GetMyTeamID()

local gameStarted

local canStockpile = {}
for udid, ud in pairs(UnitDefs) do
	if ud.canStockpile then
		canStockpile[udid] = true
	end
end

function widget:SetConfigData(data)
	MaxStockpile = data.MaxStockpile
	return
end

function widget:GetConfigData()
	return
	{
		MaxStockpile= MaxStockpile,
	}
end

function ChangeMaxStockPile(_,_,words)
    MaxStockpile = tonumber(words[1]) or MaxStockpile
    Spring.Echo("Automatic stockpile set to" .. MaxStockpile)
	UpdateStockPileAllUnits()
end

function maybeRemoveSelf()
    if Spring.GetSpectatingState() and (Spring.GetGameFrame() > 0 or gameStarted) then
        widgetHandler:RemoveWidget()
    end
end

function widget:GameStart()
    gameStarted = true
    maybeRemoveSelf()
end

function widget:PlayerChanged(playerID)
    maybeRemoveSelf()
	myTeamID = Spring.GetMyTeamID()
end

function widget:Initialize()
    if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
        maybeRemoveSelf()
    end
    --Spring.SendCommands{"luaui disablewidget Stockpiler"} -- Disable the old stockpiler widget which could conflict
    widgetHandler:AddAction("stockpilecount", ChangeMaxStockPile, nil, "t")

	-- stockpile all existing units
	UpdateStockPileAllUnits()
end

function UpdateStockPileAllUnits()
	local allUnits = GetTeamUnits(GetMyTeamID())
	for i=1,#allUnits do
		local unitID = allUnits[i]
		if canStockpile[GetUnitDefID(unitID)] then
			CancelExcessStockpile(unitID)
			DoStockPile(unitID)
		end
	end
end

function DoStockPile( unitID )
	local stock,queued = GetUnitStockpile(unitID)
	if queued and stock then
		local count = stock + queued - MaxStockpile
		while  count < 0  do
			if count < -100 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "ctrl", "shift" })
				count = count + 100
			elseif count < -20 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "ctrl" })
				count = count + 20
			elseif count < -5 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "shift" })
				count = count + 5
			else
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, 0)
				count = count + 1
			end
		end
	end
end

function CancelExcessStockpile( unitID )
	local stock,queued = GetUnitStockpile(unitID)
	if queued and stock then
		local count = stock + queued - MaxStockpile
		while count > 0 do
			if count > 100 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "right", "ctrl", "shift" })
				count = count - 100
			elseif count > 20 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "right", "ctrl" })
				count = count - 20
			elseif count > 5 then
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "right", "shift" })
				count = count - 5
			else
				GiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "right" })
				count = count - 1
			end
		end
	end
end

function widget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitTeam == myTeamID and canStockpile[unitDefID] then
		CancelExcessStockpile( unitID ) -- theorically when a unit is created it should have no stockpiled items, but better be paranoid and add this, plus code can be reused for unit given and captured
		DoStockPile( unitID )
	end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam)
	widget:UnitCreated(unitID, unitDefID, unitTeam)
end

function widget:UnitCaptured(unitID, unitDefID, unitTeam)
	widget:UnitCreated(unitID, unitDefID, unitTeam)
end

function widget:StockpileChanged(unitID, unitDefID, unitTeam, weaponNum, oldCount, newCount)
	if unitTeam == myTeamID then
		DoStockPile( unitID )
	end
end

