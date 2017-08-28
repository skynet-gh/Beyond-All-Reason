	uDef = UnitDefs[Spring.GetUnitDefID(unitID)]
	basename = uDef.customParams and uDef.customParams.basename or "base"
	turretname = uDef.customParams and uDef.customParams.turretname or "turret"
	sleevename = uDef.customParams and uDef.customParams.sleevename or "sleeve"
	cannon1name = uDef.customParams and uDef.customParams.cannon1name or "barrel"
	flare1name = uDef.customParams and uDef.customParams.flare1name or "flare"
	flare2name = uDef.customParams and uDef.customParams.flare2name or nil
	cannon2name = uDef.customParams and uDef.customParams.cannon2name or nil
	driftRatio = tonumber(uDef.customParams and uDef.customParams.driftratio) or 1
	common = include("headers/common_includes_lus.lua")
if cannon2name and flare2name then
	base, turret, sleeve, cannon1, flare1, flare2, cannon2 = piece(basename, turretname, sleevename, cannon1name, flare1name, flare2name, cannon2name)
	piecetable = {base, turret, sleeve, cannon1, flare1, cannon2, flare2}
else
	base, turret, sleeve, cannon1, flare1 = piece(basename, turretname, sleevename, cannon1name, flare1name)
	piecetable = {base, turret, sleeve, cannon1, flare1}
end

function script.Create()
	StartThread(common.SmokeUnit, {base, turret})
	COBturretYSpeed = tonumber(uDef.customParams and uDef.customParams.cobturretyspeed) or 200
	COBturretXSpeed = tonumber(uDef.customParams and uDef.customParams.cobturretxspeed) or 200
	COBkickbackRestoreSpeed = tonumber(uDef.customParams and uDef.customParams.kickbackrestorespeed) or 10
	kickback = tonumber(uDef.customParams and uDef.customParams.kickback) or -2	
	restoreTime = tonumber(uDef.customParams and uDef.customParams.restoretime) or 3000	
	rockStrength = tonumber(uDef.customParams and uDef.customParams.rockstrength) or 0.02
	rockSpeed = tonumber(uDef.customParams and uDef.customParams.rockspeed) or 3
	rockRestoreSpeed = tonumber(uDef.customParams and uDef.customParams.rockrestorespeed) or 1
	
	turretYSpeed = ProcessAngularSpeeds(COBturretYSpeed)
	turretXSpeed = ProcessAngularSpeeds(COBturretXSpeed)
	kickbackRestoreSpeed = ProcessLinearSpeeds(COBkickbackRestoreSpeed)
	gun1 = 1
	Spring.UnitScript.StartThread(UnitTurns)
	Spring.UnitScript.StartThread(UnitJumps)	
	if flare1 then
	Hide(flare1)
	end
	if flare2 then
	Hide(flare2)
	end
end

function script.RockUnit (x,z)
local ux, uy, uz = Spring.GetUnitDirection(unitID)
RockXFactor = (ux*x) + (uz*z)
RockZFactor = (uz * x) + (-ux * z)
Turn (base, 1, RockXFactor*rockStrength, rockSpeed)
Turn (base, 3, RockZFactor*rockStrength, rockSpeed)
Sleep (50)
Turn (base, 1, 0, rockRestoreSpeed)
Turn (base, 3, 0, rockRestoreSpeed)
end


function ProcessLinearSpeeds(speed)
convertedSpeed = speed
return convertedSpeed
end

function ProcessAngularSpeeds(speed)
convertedSpeed = speed*(2*math.pi)/360
return convertedSpeed
end

function GetIsTerrainWater()
x,y,z = Spring.GetUnitPosition(unitID)
if Spring.GetGroundHeight(x,z)<= -8 then
return true
else
return false
end
end

function UnitTurns()
t = 0
heading = {}
vw = 0
while (true) do
difference = 0
heading[t] = Spring.GetUnitHeading(unitID)
if heading[t-1] then
	if heading[t-1] ~= heading[t] then
		difference = heading[t] - heading[t-1]

		else
		difference = 0
	end
	if math.abs(difference * 8 * 360 / 65536) <= 15 then
	-- difference = 0
	end
	difference = difference * 8 * 360 / 65536
	if difference > 50 then 
	difference = 50
	elseif difference < -50 then
	difference = -50
	end
	if difference ~= 0 then
	end

	if heading[t-2] then
		heading[t-2] = nil
	end
	_,_,_,vw = Spring.GetUnitVelocity(unitID)
	difference = (difference * vw * 30 / 112.5) * driftRatio
end
t = t+1
if vw * 30 / 112.5 > 1 then
Turn (base, 2, difference*(2*math.pi/360), vw * 30 / 112.5)
else
Turn (base, 2, difference*(2*math.pi/360), 1)
end
Sleep (50)
end
end

function UnitJumps()
k = 0
verticalSpeed = {}
while (true) do
_,verticalSpeed[k] = Spring.GetUnitVelocity(unitID)
	if verticalSpeed[k-1] then
	YAccel = (verticalSpeed[k]*30 - verticalSpeed[k-1]*30)/0.1
		if YAccel < - Game.gravity*0.15 then
			Move(base, 2,  2 , 5)	
		else
			Move(base, 2,  0 , 15)			
		end
	end
	if verticalSpeed[k-2] then
	verticalSpeed[k-2] = nil
	end
k = k+1
Sleep(100)
end
end

function Emit(pieceName, effectName)
local x,y,z,dx,dy,dz	= Spring.GetUnitPiecePosDir(unitID, pieceName)
dx, dy, dz = 1, 0, 1
Spring.SpawnCEG(effectName, x,y,z, dx, dy, dz)
end

function script.StartMoving()
end
	
function script.StopMoving()
end

function Restore(sleeptime)
Spring.UnitScript.SetSignalMask(31)
Sleep(sleeptime)
	Turn (turret, 2, 0, turretYSpeed/2)
	Turn (sleeve, 1, 0, turretXSpeed/2)	
	Spring.UnitScript.WaitForTurn ( turret, 2 )
	Spring.UnitScript.WaitForTurn ( sleeve, 2 )
end

function script.QueryWeapon1()
if flare2 then
	if gun1 == 2 then
		return flare1
	else
		return flare2
	end
else
	return flare1	
end
end

function script.AimFromWeapon1()
return turret
end

function script.AimWeapon1( heading, pitch )
	Spring.UnitScript.Signal(31)
	Spring.UnitScript.StartThread(Restore, restoreTime)
	Turn (turret, 2, heading - difference*(2*math.pi/360), turretYSpeed)
	Turn (sleeve, 1, (0-pitch),turretXSpeed)
	WaitForTurn(turret, 2)
	WaitForTurn(sleeve, 1)
	return (true)
end

function script.Shot1()
-- Spring.Echo(gun1)
	if flare2 then
		if gun1 == 1 then
			Move(cannon1, 3, kickback)
			Move(cannon1, 3, 0, kickbackRestoreSpeed)
			gun1 = 2
		else
			Move(cannon2, 3, kickback)
			Move(cannon2, 3, 0, kickbackRestoreSpeed)
			gun1 = 1
		end
	else
		Move(cannon1, 3, kickback)
		Move(cannon1, 3, 0, kickbackRestoreSpeed)
	end
	Spring.UnitScript.Signal(31)
	Spring.UnitScript.StartThread(Restore,restoreTime)
end

function script.Killed(recentDamage, maxHealth)
	severity = recentDamage*100/maxHealth
	if severity <= 25 then
		for count, piece in pairs(piecetable) do
			randomnumber = math.random(1,7)
			if randomnumber == 1 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.FIRE, SFX.SMOKE, SFX.NO_HEATCLOUD, SFX.FALL)
			elseif randomnumber == 2 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.SHATTER, SFX.NO_HEATCLOUD)
			else
				Explode(piece, SFX.SHATTER, SFX.NO_HEATCLOUD)
			end
			Hide(piece)
		end
		return 1
	elseif severity <=50 then
		for count, piece in pairs(piecetable) do
			randomnumber = math.random(1,5)
			if randomnumber == 1 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.FIRE, SFX.SMOKE, SFX.NO_HEATCLOUD, SFX.FALL)
			elseif randomnumber == 2 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.SHATTER, SFX.NO_HEATCLOUD)
			else
				Explode(piece, SFX.SHATTER, SFX.NO_HEATCLOUD)
			end
			Hide(piece)
		end
		return 2
	elseif severity <= 99 then
		for count, piece in pairs(piecetable) do
			randomnumber = math.random(1,3)
			if randomnumber == 1 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.FIRE, SFX.SMOKE, SFX.NO_HEATCLOUD, SFX.FALL)
			elseif randomnumber == 2 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.SHATTER, SFX.NO_HEATCLOUD)
			else
				Explode(piece, SFX.SHATTER, SFX.NO_HEATCLOUD)
			end
			Hide(piece)
		end
		return 3
	else
		for count, piece in pairs(piecetable) do
			randomnumber = math.random(1,2)
			if randomnumber == 1 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.FIRE, SFX.SMOKE, SFX.NO_HEATCLOUD, SFX.FALL)
			elseif randomnumber == 2 then
				Explode(piece, SFX.EXPLODE_ON_HIT, SFX.SHATTER, SFX.NO_HEATCLOUD)
			else
				Explode(piece, SFX.SHATTER, SFX.NO_HEATCLOUD)
			end
			Hide(piece)
		end
		return 3
	end
end
