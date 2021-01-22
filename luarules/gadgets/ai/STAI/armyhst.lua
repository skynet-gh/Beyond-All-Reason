ArmyHST = class(Module)

function ArmyHST:Name()
	return "ArmyHST"
end

function ArmyHST:internalName()
	return "armyhst"
end


function ArmyHST:Init()
	self.DebugEnabled = false
	self.unitTable = {}
	self.wrecks = {}
	self.featureTable = {}
-------MOBILE----------------

	self.techs = {
		corca = true,
		armch = true,
		corch = true,
		armacsub = true,
		armca = true,
		corcsa = true, --plat
		armcsa = true, --plat
		armcv = true,
		coracv = true,
		coraca = true,
		armacv = true,
		armack = true,
		corack = true,
		corcv = true,
		armaca = true,
		corcs = true,
		armcs = true,
		corck = true,
		armck = true,



	}
	self.engineers = {
		armmls = true,
		armfark = true,
		armconsul = true,
		corfast = true,
		cormls = true,

	}
	self.wartechs = {
		armdecom = true,
		cordecom = true,
		cormando = true,


	} --decoy etc
	self.rezs = {
		armrectr = true,
		cornecro = true,
		armrecl = true,
		correcl = true,

	}
	self.amptechs = {
		armbeaver = true,
		cormuskrat = true,


	} --amphibious builders
	self.miners = {
		armmlv = true,
		cormlv = true,
	}

	self.jammers = {
		armsjam = true,
		coreter = true,
		armaser = true,
		armjam = true,
		corsjam = true,
		corspec = true,


	}
	self.radars = {
		corfink = true,--is a scout but is better used as radar cause no weapon
		armpeep = true,--is a scout but is better used as radar cause no weapon
		corvrad = true,
		armmark = true,
		armseer = true,
		corvoyr = true,
		corawac = true,
		armawac = true,
		armsehak = true,
		corhunt = true,


	}
	self.spys = {
		armspy = true,
		corspy = true,
	}
	self.transports = {
		corvalk = true,
		armatlas = true,
		armthovr = true,
		corthovr = true,
		corintr = true,
		armdfly = true,
		cortship = true,
		armtship = true,
		corseah = true,

	}

	self.scouts = {
		armfast = true,
		armflea = true,
		armfav = true,
		corfav = true,

	}
	self.raiders = {
		armflash = true,
		corak = true,
		armpw = true,
		armmav = true,
		armlatnk = true,
		corgator = true,
		corseal = true,
		corpyro = true,
		armsh = true,
		corsh = true,
		corcrus = true,
		armcrus = true,
		armdecade = true,
		coresupp = true,
		corkarg = true,

	}
	self.artillerys = {
		armart = true,
		armfido = true,
		cormort = true,
		corhrk = true,
		armmerl = true,
		armmart = true,
		corwolv = true,
		armvang = true,
		armmh = true,
		cormh = true,
		cormship = true,
		armmship = true,
		corcat = true,
		corvroc = true,
		cortrem = true,
		cormart = true,

	}
	self.battles = {
		armstump = true,
		correap = true,
		armzeus = true,
		armbull = true,
		corraid = true,
		corstorm = true,
		armrock = true,
		corcan = true,
		armraz = true,
		corsnap = true,
		corbats = true,
		armbats = true,
		armpship = true,
		corjugg = true,
		corban = true,

	} -- sturdy, cheap units to be built in larger numbers than siege units
	self.breaks = {
		armjanus = true,
		corlevlr = true,
		corgol = true,
		armfboy = true,
		armmanni = true,
		corblackhy = true,
		armepoch = true,
		corthud = true,
		corsumo = true,
		armwar = true,
		armham = true,
		armbanth = true,
		armanac = true,
		corhal = true,
		armroy = true,
		corroy = true,
		corkorg = true,
	}

	self.spiders = {
		cortermite = true,
		armsptk = true,

	}
	self.paralyzers = {
		corbw = true,
		armspid = true,
		armstil = true,

	}
	self.subkillers = {
		armsubk = true,
		armserp = true,
		corsub = true,
		armsub = true,
		corssub = true,
		corshark = true,


	} -- submarine weaponed
	self.bomberairs = {
		corshad = true,
		armthund = true,
		armsb = true, --plat
		corhurc = true,
		armpnix = true,
		armliche = true,
		corsb = true,
	}

	self.fighterairs = {
		corveng = true,
		armfig = true,
		corsfig = true, --plat
		armsfig = true, --plat
		cortitan = true,
		armhawk = true,
	}

	self.tpbombers = {
		corvamp = true,
		armlance = true,


	}

	self.airgun = {
		armkam = true,
		corcrw = true,
		corape = true,
		armbrawl = true,
		armblade = true,
		armseap = true, -- but is a torpedo gunship
		armsaber = true,
		corseap = true,
		corcut = true,

	}

	self.antiairs = {
		armah = true,
		corah = true,
		armaas = true,
		armsam = true,
		corsent = true,
		armaak = true,
		armyork = true,
		cormist = true,
		corcrash = true,
		armjeth = true,
		coraak = true,
		corarch = true,
		armpt = true, --aa+scout
		corpt = true, --aa+scout
	}

	self.antinukes = {
		armcarry = true,
		corcarry = true,
		cormabm = true,
		armscab = true,
	}

	self.amphibious = {
		armpincer = true,
		corparrow = true,
		armcroc = true,
		armamph = true,
		corgarp = true,
		coramph = true,
		armmar = true,
		armlun = true,
		corshiva = true,
		corsok = true,
	}

	self.crawlings = {
		armvader = true,
		corroach = true,
		corsktl = true,
	}

	self.cloakables = {
		armsnipe = true,
		armgremlin = true,
	}

-------IMMOBILE--------
	self._targeting_ = {
		armtarg = true ,
		armfatf = true ,
		cortarg = true ,
		corfatf = true ,
	}

	self._geo_ = {
		corageo = true ,
		armageo = true ,
		armgeo = true ,
		corgeo = true ,
		corbhmth = true ,
		armgmm = true ,
	}


	self._nano_ = {
		armnanotc = true ,
		armnanotcplat = true ,
		cornanotc = true ,
		cornanotcplat = true ,
		cormoho = true ,
	}

	self._solar_ = {
		corsolar = true ,
		armsolar = true ,
	}

	self._advsol_ = {
		coradvsol = true ,
		armadvsol = true ,
	}

	self._mex_ = {
		cormex = true ,
		armuwmex = true ,
		coruwmex = true ,
		cormexp = true ,
		armmex = true ,
		armamex = true ,
		armmoho = true ,
		corexp = true ,
		armuwmme = true ,
		coruwmme = true ,
	}

	self._flak_ = {
		armfflak = true ,
		armflak = true ,
		corflak = true ,
		corenaa = true ,
	}

	self._mine_ = {
		armmine1 = true ,
		armmine2 = true ,
		armmine3 = true ,
		armfmine3 = true ,
		cormine1 = true ,
		cormine2 = true ,
		cormine3 = true ,
		cormine4 = true ,
		corfmine3 = true ,
	}

	self._eyes_ = {
		armeyes = true ,
		coreyes = true ,
	}

	self._fus_ = {
		armfus = true ,
		armafus = true ,
		armuwfus = true ,
		armckfus = true ,
		corfus = true ,
		corafus = true ,
		coruwfus = true ,
		--armdf = true, --fake fus
	}

	self._silo_ = {
		armsilo = true ,
		corsilo = true ,
	}

	self._wind_ ={
		armwin = true ,
		corwin = true ,
	}

	self._tide_ = {
		cortide = true ,
		armtide = true ,
	}

	self._plat_ = {
		corplat = true ,
		armplat = true ,
	}

	self._radar_ = {
		armrad = true ,
		armarad = true ,
		corrad = true ,
		corarad = true ,
		corfrad = true ,
		armfrad = true ,
	}

	self._jam_ = {
		armjamt = true ,
		corjamt = true ,
		armveil = true ,
		corshroud = true ,
	}

	self._sonar_ = {
		armsonar = true ,
		corsonar = true ,
		armason = true,
		corason = true,
	}

	self._shield_ = {
		armgate = true ,
		corgate = true ,
	}

	self._juno_ = {
		corjuno = true ,
		armjuno = true ,
	}

	self._popup1_ = {
		armclaw = true,
		cormaw = true,
	}

	self._llt_ = {
		armllt = true,
		corllt = true,
	}

	self._specialt_ = {
		armbeamer = true,
		corhllt = true,
	}

	self._heavyt_ = {
		armhlt = true,
		corhlt = true,
		armfhlt = true,
		corfhlt = true,
	}

	self._lol_ = {
		corbuzz = true ,
		armvulc = true ,
	}

	self._laser2_ = {
		cordoom = true ,
		armanni = true ,
	}

	self._coast1_ = {
		corpun = true ,
		armguard = true ,
	}

	self._coast2_ = {
		cortoast = true ,
		armamb = true ,
	}

	self._popup2_ = {
		armpb = true ,
		corvipe = true ,
	}

	self._plasma_ = {
		armbrtha = true ,
		corint = true ,
	}

	self._torpedo1_ = {
		cortl = true ,
		armtl = true ,
		armptl = true ,
		corptl = true ,
	}

	self._torpedo2_ = {
		coratl = true ,
		armatl = true ,
	}

	self._torpedoground_ = {
		armdl = true ,
		cordl = true ,
	}

	self._aa1_ = {
		armrl = true ,
		corrl = true ,
		armfrt = true ,
		corfrt = true ,
	}

	self._aabomb_ = {
		corerad = true ,
		armferret = true ,
	}

	self._aaheavy_ = {
		cormadsam = true ,
		armcir = true ,
	}
	self._aa2_ = {
		corscreamer = true ,
		armmercury = true ,
	}

	self._intrusion_ = {
		corsd = true ,
		armsd = true ,
	}

	self._antinuke_ = {
		armamd = true ,
		corfmd = true ,
	}

	self._airPlat_ = {
		armasp = true ,
		corasp = true ,
	}

	self._convs_ = {
		armmmkr = true ,
		armfmkr = true ,
		armmakr = true ,
		armuwmmm = true ,
		cormmkr = true ,
		corfmkr = true ,
		cormakr = true ,
	}

	self._estor_ = {
		armestor = true ,
		armuwes = true ,
		armuwadves = true ,
		corestor = true ,
		coruwes = true ,
		coruwadves = true ,
	}

	self._mstor_ = {
		cormstor = true ,
		armmstor = true ,
		armuwms = true ,
		coruwms = true ,
		coruwadvms = true ,
		armuwadvms = true ,
		coruwmmm = true ,
	}

	self._tactical_ = {
		armemp = true ,
		cortron = true ,
	}

	self._wall_ = {
		corfdrag = true ,
		armdrag = true ,
		armfort = true ,
		cordrag = true ,
		armfdrag = true ,
	}

	self:GetUnitTable()
	self:GetFeatureTable()

	self.buildersRole = {
		default = {},
		eco = {},
		expand = {},
		support = {},

	}



end


ArmyHST.techPenalty = {
	armamsub = -1,
	coramsub = -1,
	armfhp = -1,
	corfhp = -1,
	armhp = -1,
	corhp = -1,
}

ArmyHST.factoryMobilities = {
	corap = {"air"},
	armap = {"air"},
	corlab = {"bot"},
	armlab = {"bot"},
	corvp = {"veh", "amp"},
	armvp = {"veh", "amp"},
	coralab = {"bot"},
	coravp = {"veh", "amp"},
	corhp = {"hov"},
	armhp = {"hov"},
	corfhp = {"hov"},
	armfhp = {"hov"},
	armalab = {"bot"},
	armavp = {"veh", "amp"},
	coraap = {"air"},
	armaap = {"air"},
	corplat = {"air"},
	armplat = {"air"},
	corsy = {"shp", "sub"},
	armsy = {"shp", "sub"},
	corasy = {"shp", "sub"},
	armasy = {"shp", "sub"},
	coramsub = {"amp","sub"},
	armamsub = {"amp","sub"},
	corgant = {"bot", "amp"},
	armshltx = {"bot", "amp"},
	corgantuw = {"amp"},
	armshltxuw = {"amp"},
}

-- for calculating what factories to build
-- higher values mean more effecient
ArmyHST.mobilityEffeciencyMultiplier = {
	veh = 1,
	shp = 1,
	bot = 0.9,
	sub = 0.9,
	hov = 0.7,
	amp = 0.4,
	air = 0.55,
}

ArmyHST.factoryExitSides = {
	corap = 0,
	armap = 0,
	corlab = 2,
	armlab = 2,
	corvp = 1,
	armvp = 1,
	coralab = 3,
	coravp = 1,
	corhp = 2,
	armhp = 2,
	corfhp = 2,
	armfhp = 2,
	armalab = 2,
	armavp = 2,
	coraap = 0,
	armaap = 0,
	corplat = 0,
	armplat = 0,
	corsy = 4,
	armsy = 4,
	corasy = 4,
	armasy = 4,
	coramsub = 4,
	armamsub = 4,
	corgant = 1,
	armshltx = 1,
	corgantuw = 1,
	armshltxuw = 1,
}

ArmyHST.littlePlasmaList = {
	corpun = 1,
	armguard = 1,
	cortoast = 1,
	armamb = 1,
	corbhmth = 1,
}

-- these big energy plants will be shielded in addition to factories
ArmyHST.bigEnergyList = {
	corageo = 1,
	armageo = 1,
	corfus = 1,
	armfus = 1,
	corafus = 1,
	armafus = 1,
}

-- geothermal plants
ArmyHST.geothermalPlant = {
	corgeo = 1,
	armgeo = 1,
	corageo = 1,
	armageo = 1,
	corbhmth = 1,
	armgmm = 1,
}

-- what mexes upgrade to what
ArmyHST.mexUpgrade = {
	cormex = "cormoho",
	armmex = "armmoho",
	coruwmex = "coruwmme",--ex coruwmex caution this will be changed --TODO
	armuwmex = "armuwmme",--ex armuwmex
	armamex = "armmoho",
	corexp = "cormexp",

}

-- these will be abandoned faster
ArmyHST.hyperWatchdog = {
	armmex = 1,
	cormex = 1,
	armgeo = 1,
	corgeo = 1,
}


-- priorities of things to defend that can't be accounted for by the formula in turtlehst
ArmyHST.turtleList = {
	cormakr = 0.5,
	armmakr = 0.5,
	corfmkr = 0.5,
	armfmkr = 0.5,
	cormmkr = 4,
	armmmkr = 4,
	corfmmm = 4,
	armfmmm = 4,
	corestor = 0.5,
	armestor = 0.5,
	cormstor = 0.5,
	armmstor = 0.5,
	coruwes = 0.5,
	armuwes = 0.5,
	coruwms = 0.5,
	armuwms = 0.5,
	coruwadves = 2,
	armuwadves = 2,
	coruwadvms = 2,
	armuwadvms = 2,
}

-- factories that can build advanced construction units (i.e. moho mines)
ArmyHST.advFactories = {
	coravp = 1,
	coralab = 1,
	corasy = 1,
	coraap = 1,
	corplat = 1,
	armavp = 1,
	armalab = 1,
	armasy = 1,
	armaap = 1,
	armplat = 1,
}

-- experimental factories
ArmyHST.expFactories = {
	corgant = 1,
	armshltx = 1,
	corgantuw = 1,
	armshltxuw = 1,
}

-- leads to experimental
ArmyHST.leadsToExpFactories = {
	corlab = 1,
	armlab = 1,
	coralab = 1,
	armalab = 1,
	corsy = 1,
	armsy = 1,
	corasy = 1,
	armasy = 1,
}
-- for milling about next to con units and factories only
ArmyHST.defenderList = {
	armaak = 1 ,
	corcrash = 1 ,
	armjeth = 1 ,
	corsent = 1 ,
	armyork = 1 ,
	corah = 1 ,
	armaas = 1 ,
	armah = 1 ,
	corarch = 1 ,
	armaser = 1 ,
	armjam = 1 ,
	armsjam = 1 ,
	coreter = 1 ,
	corsjam = 1 ,
	corspec = 1 ,
	armfig = 1 ,
	armhawk = 1 ,
	armsfig = 1 ,
	corveng = 1 ,
	corvamp = 1 ,
	corsfig = 1 ,
}

ArmyHST.raiderDisarms = {
	corbw = 1,
}

ArmyHST.commanderList = {
	armcom = 1,
	corcom = 1,
}

-- advanced construction units
ArmyHST.advConList = {
	corack = 1,
	armack = 1,
	coracv = 1,
	armacv = 1,
	coraca = 1,
	armaca = 1,
	coracsub = 1,
	armacsub = 1,
}

ArmyHST.groundFacList = {
	corvp = 1,
	armvp = 1,
	coravp = 1,
	armavp = 1,
	corlab = 1,
	armlab = 1,
	coralab = 1,
	armalab = 1,
	corhp = 1,
	armhp = 1,
	corfhp = 1,
	armfhp = 1,
	coramsub = 1,
	armamsub = 1,
	corgant = 1,
	armshltx = 1,
	corfast = 1,
	armconsul = 1,
	armfark = 1,
}

-- if any of these is found among enemy units, AA units and fighters will be built
ArmyHST.airFacList = {
	corap = 1,
	armap = 1,
	coraap = 1,
	armaap = 1,
	corplat = 1,
	armplat = 1,
}

-- if any of these is found among enemy units, torpedo launchers and sonar will be built
ArmyHST.subFacList = {
	corsy = 1,
	armsy = 1,
	corasy = 1,
	armasy = 1,
	coramsub = 1,
	armamsub = 1,
}

-- if any of these is found among enemy units, plasma shields will be built
ArmyHST.bigPlasmaList = {
	corint = 1,
	armbrtha = 1,
}

-- if any of these is found among enemy units, antinukes will be built
-- also used to assign nuke behaviour to own units
-- values are how many frames it takes to stockpile
ArmyHST.nukeList = {
	armsilo = 3600,
	corsilo = 5400,
	armemp = 2700,
	cortron = 2250,
}

-- ArmyHST.seaplaneConList = {
-- 	corcsa = 1,
-- 	armcsa = 1,
-- }


ArmyHST.Eco1={
	armsolar=1,
	armwin=1,
	armadvsol=1,
	armtide=1,

	corsolar=1,
	corwin=1,
	coradvsol=1,
	cortide=1,

	corgeo=1,
	armgeo=1,

	--store

	armestor=1,
	armmstor=1,
	armuwes=1,
	armuwms=1,

	corestor=1,
	cormstor=1,
	coruwes=1,
	coruwms=1,

	--conv
	armmakr=1,
	cormakr=1,
	armfmkr=1,
	corfmkr=1,


	--metalli
	corexp=1,
	armamex=1,

	cormex=1,
	armmex=1,

	armuwmex=1,
	coruwmex=1,

	armnanotc=1,
	cornanotc=1,
	armnanotcplat = 1,
	cornanotcplat = 1,
}

ArmyHST.Eco2={
	--metalli
	armmoho=4,
	cormoho=4,
	cormexp=4,

	coruwmme=0,
	armuwmme=0,

	--magazzini
	armuwadves=3,
	armuwadvms=3,

	coruwadves=3,
	coruwadvms=3,

	corageo = 4,
	armageo = 4,
	corbhmth = 4,
	armgmm = 4,

	corfus = 1,
	armfus = 1,
	corafus = 1,
	armafus = 1,
	armuwfus = 0,
	coruwfus = 0,

	--convertitori
	cormmkr=1,
	armmmkr=1,
	corfmmm=0,
	armfmmm=0,
}

ArmyHST.cleaners = {
	armbeaver = 1,
	cormuskrat = 1,
	armcom = 1,
	corcom = 1,
	armdecom = 1,
	cordecom = 1,
}

ArmyHST.cleanable = {
	armsolar= 'ground',
	corsolar= 'ground',
	armadvsol = 'ground',
	coradvsol = 'ground',
	armtide = 'floating',
	cortite = 'floating',
	armfmkr = 'floating',
	corfmkr = 'floating',
	cormakr = 'ground',
	armmakr = 'ground',
	corwin = 'ground',
	armwin = 'ground',
}

-- minimum, maximum, starting point units required to attack, bomb
ArmyHST.minAttackCounter = 8
ArmyHST.maxAttackCounter = 30
ArmyHST.baseAttackCounter = 15
ArmyHST.breakthroughAttackCounter = 16 -- build heavier battle units
ArmyHST.siegeAttackCounter = 20 -- build siege units
ArmyHST.minBattleCount = 4 -- how many battle units to build before building any breakthroughs, even if counter is too high
ArmyHST.minBomberCounter = 0
ArmyHST.maxBomberCounter = 16
ArmyHST.baseBomberCounter = 2
ArmyHST.breakthroughBomberCounter = 8 -- build atomic bombers or air fortresses

-- raid counter works backwards: it determines the number of raiders to build
-- if it reaches ArmyHST.minRaidCounter, none are built
ArmyHST.minRaidCounter = 0
ArmyHST.maxRaidCounter = 8
ArmyHST.baseRaidCounter = 5

-- Taskqueuebehaviour was modified to skip this name
ArmyHST.DummyUnitName = "skipthisorder"

-- Taskqueuebehaviour was modified to use this as a generic "build me a factory" order
ArmyHST.FactoryUnitName = "buildfactory"

-- this unit is used to check for underwater metal spots
ArmyHST.UWMetalSpotCheckUnit = "coruwmex"

-- for non-lua only; tests build orders of these units to determine mobility there
-- multiple units for one mtype function as OR
ArmyHST.mobUnitNames = {
	veh = {"corcv", "armllt"},
	bot = {"corck", "armeyes"},
	amp = {"cormuskrat"},
	hov = {"corsh", "armfdrag"},
	shp = {"corcs"},
	sub = {"coracsub"},
}

-- tests move orders of these units to determine mobility there
ArmyHST.mobUnitExampleName = {
	veh = "armcv",
	bot = "armck",
	amp = "armbeaver",
	hov = "armch",
	shp = "armcs",
	sub = "armacsub"
}

-- side names
ArmyHST.CORESideName = "cortex"
ArmyHST.ARMSideName = "armada"

-- how much metal to assume features with these strings in their names have
ArmyHST.baseFeatureMetal = { rock = 30, heap = 80, wreck = 150 }


local unitsLevels = {}
local armTechLv ={}
local corTechLv ={}
corTechLv.corcom = false
armTechLv.armcom = false
local parent = 0
local continue = false

local featureKeysToGet = { "metal" , "energy", "reclaimable", "blocking", }

local function getDPS(unitDefID)
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	local dps = 0
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		dps = dps + weaponDef['damages'][0] / weaponDef['reload']
	end
	----Spring.Echo('dps',dps)
	return dps
end



local function getInterceptor(unitDefID)
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	local interceptor = false
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		if weaponDef['interceptor'] then
			interceptor  =  weaponDef['interceptor'] == 1
		end
	end
	----Spring.Echo('interceptor',interceptor)
	return interceptor
end

local function getTargetableWeapon(unitDefID)
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	local targetable = false
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		if weaponDef['targetable'] then
			targetable  =  weaponDef['targetable'] == 1
		end
	end
	----Spring.Echo('targetable',targetable)
	return targetable
end

local function getParalyzer(unitDefID)
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		paralyzer  =  weaponDef['paralyzer']
	end
	----Spring.Echo('paralyzer',paralyzer)
	return paralyzer
end

local function getOnlyTargets(weapons)
	local targets = {}
	for index,weapon in pairs (weapons) do
		if weapon.onlyTargets then
			for name,_ in pairs(weapon.onlyTargets) do
				local  weaponDefID = weapon["weaponDef"]
				local weaponDef = WeaponDefs[weaponDefID]
				targets[name] = weaponDef.range
			end
		end
	end
	return targets
end

local function getBadTargets(weapons)
	local targets = {}
	for index,weapon in pairs (weapons) do
		if weapon.badTargets then
			for name,_ in pairs(weapon.badTargets) do
				local  weaponDefID = weapon["weaponDef"]
				local weaponDef = WeaponDefs[weaponDefID]
				targets[name] = weaponDef.range
				----Spring.Echo('defbadtargets', targets[name])
			end
		end
	end
	----Spring.Echo('badtargets',targets)
	return targets
end
local function GetLongestWeaponRange(unitDefID, GroundAirSubmerged)
	local weaponRange = 0
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	local dps = 0
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		-- --Spring.Echo(weaponDefID)
		-- --Spring.Echo(weaponDef["canAttackGround"])
		-- --Spring.Echo(weaponDef["waterWeapon"])
		----Spring.Echo(weaponDef["range"])
		----Spring.Echo(weaponDef["type"])
		local wType = 0
		if weaponDef["canAttackGround"] == false then
			wType = 1
		elseif weaponDef["waterWeapon"] then
			wType = 2
		else
			wType = 0
		end
		-- --Spring.Echo(wType)
		if wType == GroundAirSubmerged then
			if weaponDef["range"] > weaponRange then
				weaponRange = weaponDef["range"]
			end
		end

	end

	return weaponRange
end

local function GetBuiltBy()
	local builtBy = {}
	for unitDefID,unitDef in pairs(UnitDefs) do
		if unitDef.buildOptions and #unitDef.buildOptions > 0 then
			for i, buildDefID in pairs(unitDef.buildOptions) do
				local buildDef = UnitDefs[buildDefID]
				builtBy[buildDefID] = builtBy[buildDefID] or {}
				table.insert(builtBy[buildDefID], unitDefID)
			end
		end
	end
	return builtBy
end

local function GetWeaponParams(weaponDefID)
	local WD = WeaponDefs[weaponDefID]
	local WDCP = WD.customParams
	local weaponDamageSingle = tonumber(WDCP.statsdamage) or WD.damages[0] or 0
	local weaponDamageMult = tonumber(WDCP.statsprojectiles) or ((tonumber(WDCP.script_burst) or WD.salvoSize) * WD.projectiles)
	local weaponDamage = weaponDamageSingle * weaponDamageMult
	local weaponRange = WD.range

	local reloadTime = tonumber(WD.customParams.script_reload) or WD.reload

	if WD.dyndamageexp and WD.dyndamageexp > 0 then
		local dynDamageExp = WD.dyndamageexp
		local dynDamageMin = WD.dyndamagemin or 0.0001
		local dynDamageRange = WD.dyndamagerange or weaponRange
		local dynDamageInverted = WD.dyndamageinverted or false
		local dynMod

		if dynDamageInverted then
			dynMod = math.pow(distance3D / dynDamageRange, dynDamageExp)
		else
			dynMod = 1 - math.pow(distance3D / dynDamageRange, dynDamageExp)
		end

		weaponDamage = math.max(weaponDamage * dynMod, dynDamageMin)
	end

	local dps = weaponDamage / reloadTime
	return dps, weaponDamage, reloadTime
end




local function GetUnitSide(name)--TODO change to the internal name armada cortex
	if string.find(name, 'arm') then
		return 'arm'
	elseif string.find(name, 'cor') then
		return 'core'
	elseif string.find(name, 'chicken') then
		return 'chicken'
	end
	return 'unknown'
end

local function getTechTree(sideTechLv)
	continue = false
	local tmp = {}
	for name,lv in pairs(sideTechLv) do
		if lv == false then
			sideTechLv[name] = parent
			if ArmyHST.techPenalty[name] then sideTechLv[name] = sideTechLv[name] + ArmyHST.techPenalty[name] end--here cause some not corresponding at true and seaplane maybe
			canBuild = UnitDefNames[name].buildOptions
			if canBuild and #canBuild > 0 then
				for index,id in pairs(UnitDefNames[name].buildOptions) do
					if not sideTechLv[UnitDefs[id].name] then
						tmp[UnitDefs[id].name] = false
						continue = true
					end
				end
			end
		end
	end
	for name,lv in pairs(tmp) do
		sideTechLv[name] = lv
	end
	if continue  then
		parent = parent + 1
		getTechTree(sideTechLv)
	end
	parent = 0
end
function ArmyHST:GetUnitTable()
	local builtBy = GetBuiltBy()
	local unitTable = {}
	local wrecks = {}
	for unitDefID,unitDef in pairs(UnitDefs) do
		local side = GetUnitSide(unitDef.name)
		if unitsLevels[unitDef.name] then



			-- --Spring.Echo(unitDef.name, "build slope", unitDef.maxHeightDif)
			-- if unitDef.moveDef.maxSlope then
			-- --Spring.Echo(unitDef.name, "move slope", unitDef.moveDef.maxSlope)
			-- end
			self.unitTable[unitDef.name] = {}

			local utable = self.unitTable[unitDef.name]
			utable.name = unitDef.name
			utable.side = side
			utable.defId = unitDefID
			utable.radarRadius = unitDef["radarRadius"]
			utable.airLosRadius = unitDef["airLosRadius"]
			utable.losRadius = unitDef["losRadius"]
			utable.sonarRadius = unitDef["sonarRadius"]
			utable.jammerRadius = unitDef["jammerRadius"]
			utable.stealth = unitDef.stealth
			utable.metalCost = unitDef["metalCost"]
			utable.energyCost = unitDef["energyCost"]
			utable.buildTime = unitDef["buildTime"]
			utable.totalEnergyOut = unitDef["totalEnergyOut"]
			utable.extractsMetal = unitDef["extractsMetal"]
			utable.energyMake = unitDef.energyMake
			utable.energyUse = unitDef.energyUpkeep
			utable.isTransport = unitDef.isTransport
			utable.isImmobile = unitDef.isImmobile
			utable.isBuilding = unitDef.isBuilding
			utable.isBuilder = unitDef.isBuilder
			utable.isMobileBuilder = unitDef.isMobileBuilder
			utable.isStaticBuilder = unitDef.isStaticBuilder
			utable.isFactory = unitDef.isLab
			utable.isExtractor = unitDef.Extractor
			utable.isGroundUnit = unitDef.isGroundUnit
			utable.isAirUnit = unitDef.isAirUnit
			utable.isStrafingAirUnit = unitDef.isStrafingAirUnit
			utable.isHoveringAirUnit = unitDef.isHoveringAirUnit
			utable.isFighterAirUnit = unitDef.isFighterAirUnit
			utable.isBomberAirUnit = unitDef.isBomberAirUnit
			utable.noChaseCat = unitDef.noChaseCategories
			utable.maxWeaponRange = unitDef.maxWeaponRange
			utable.mclass = unitDef.moveDef.name
			utable.speed = unitDef.speed
			utable.accel = unitDef.maxAcc
			utable.move = unitDef.speed * unitDef.maxAcc * unitDef.turnRate * unitDef.maxDec
			utable.hp = unitDef.health
			utable.buildSpeed = unitDef.buildSpeed
			utable.canAssist = unitDef.canAssist
			utable.canCloak = unitDef.canCloak
			utable.upright = unitDef.upright
			utable.canResurrect = unitDef.canResurrect
			utable.windGenerator = unitDef.windGenerator
			utable.tidalGenerator = unitDef.tidalGenerator
			utable.energyStorage = unitDef.energyStorage
			utable.metalStorage = unitDef.metalStorage
			utable.energyConv = unitDef.customParams.energyconv
			utable.groundRange = GetLongestWeaponRange(unitDefID, 0)
			utable.airRange = GetLongestWeaponRange(unitDefID, 1)
			utable.submergedRange = GetLongestWeaponRange(unitDefID, 2)
			utable.dps = getDPS(unitDefID)
			utable.antiNuke = getInterceptor(unitDefID)
			utable.targetableWeapon = getTargetableWeapon(unitDefID)
			utable.paralyzer = getParalyzer(unitDefID)
-- 			Spring:Echo(unitDef.name)
			utable.techLevel = unitsLevels[unitDef["name"]]
			if unitDef["modCategories"]["weapon"] then
				utable.isWeapon = true
			else
				utable.isWeapon = false
			end
			if unitDef["weapons"][1] then
				local defWepon1 = unitDef["weapons"][1]
				utable.onlyTargets = getOnlyTargets(unitDef["weapons"])
				utable.badTargets = getBadTargets(unitDef["weapons"])
				utable.firstWeapon = WeaponDefs[unitDef["weapons"][1]["weaponDef"]]
				utable.weaponType = utable.firstWeapon['type']
				utable.badTg = ''
				if defWepon1.badTargets then
					for ii,vv in pairs(defWepon1.badTargets) do
						--Spring:Echo(ii)
						utable.badTg = utable.badTg .. ii

					end
				end
				utable.onlyTg = ''
				if defWepon1.onlyTargets then
					for ii,vv in pairs(defWepon1.onlyTargets) do
						utable.onlyTg = utable.onlyTg .. ii
					end
				end
				utable.onlyBadTg = utable.onlyTg .. utable.badTg
			end



			--Spring:Echo(unitDef.name,utable.antiNuke)
			if unitDef.speed == 0 and utable.isWeapon then
				utable.isTurret = true
				if unitDef.modCategories.mine then
					utable.isMine = utable.techLevel
				elseif utable.firstWeapon and utable.firstWeapon['type'] == ('StarburstLauncher' or 'MissileLauncher') then
					utable.isTacticalTurret =  utable.techLevel
				elseif utable.firstWeapon and utable.firstWeapon['type'] == 'Cannon' then
					utable.isCannonTurret = utable.techLevel
					if not utable.firstWeapon.selfExplode then
						utable.isPlasmaCannon = utable.techLevel
					end
				elseif utable.firstWeapon and utable.firstWeapon['type'] == 'BeamLaser' then
					utable.isLaserTurret = utable.techLevel
				elseif utable.firstWeapon and utable.firstWeapon['type'] == 'TorpedoLauncher' then
					utable.isTorpedoTurret = utable.techLevel
				end
				if utable.groundRange and utable.groundRange > 0 then
					utable.isGroundTurret = utable.groundRange
				end
				if utable.airRange and utable.airRange > 0 then
					utable.isAirTurret = utable.airRange
				end
				if utable.submergedRange and utable.submergedRange > 0 then
					utable.isSubTurret = utable.submergedRange
				end
			end
			if utable.isFighterAirUnit then
				utable.airRange = utable.groundRange
			end
			utable.needsWater = unitDef.minWaterDepth > 0
			if unitDef["canFly"] then
				utable.mtype = "air"
			elseif	utable.isBuilding and utable.needsWater then
				utable.mtype = 'sub'
			elseif	utable.isBuilding and not utable.needsWater then
				utable.mtype = 'veh'
			elseif  unitDef.moveDef.name and (string.find(unitDef.moveDef.name, 'abot') or string.find(unitDef.moveDef.name, 'vbot')  or string.find(unitDef.moveDef.name,'atank'))  then
				utable.mtype = 'amp'
			elseif unitDef.moveDef.name and string.find(unitDef.moveDef.name, 'uboat') then
				utable.mtype = 'sub'
			elseif unitDef.moveDef.name and  string.find(unitDef.moveDef.name, 'hover') then
				utable.mtype = 'hov'
			elseif unitDef.moveDef.name and string.find(unitDef.moveDef.name, 'boat') then
				utable.mtype = 'shp'
			elseif unitDef.moveDef.name and string.find(unitDef.moveDef.name, 'tank') then
				utable.mtype = 'veh'
			elseif unitDef.moveDef.name and string.find(unitDef.moveDef.name, 'bot') then
				utable.mtype = 'bot'
			else
				if unitDef.maxwaterdepth and unitDef.maxwaterdepth < 0 then
					utable.mtype = 'shp'
				else
					utable.mtype = 'veh'
				end
			end

			if unitDef["isBuilder"] and #unitDef["buildOptions"] < 1 and not unitDef.moveDef.name then
				utable.isNano = true
			end

			if unitDef["isBuilder"] and #unitDef["buildOptions"] > 0 then
				utable.buildOptions = true
				if unitDef["isBuilding"] then
					utable['isFactory'] = {}
					utable.unitsCanBuild = {}
					for i, oid in pairs (unitDef["buildOptions"]) do
						local buildDef = UnitDefs[oid]
						table.insert(utable.unitsCanBuild, buildDef["name"])
						--and save all the mtype that can andle
						--utable.isFactory[unitName[buildDef.name].mtype] = TODO
					end

				else
					utable.factoriesCanBuild = {}
					utable.buildingsCanBuild = {}
					for i, oid in pairs (unitDef["buildOptions"]) do

						local buildDef = UnitDefs[oid]
						table.insert(utable.buildingsCanBuild, buildDef["name"])
						if #buildDef["buildOptions"] > 0 and buildDef["isBuilding"] then
							-- build option is a factory, add it to factories this unit can build
							table.insert(utable.factoriesCanBuild, buildDef["name"])

						end
					end
					if #utable.factoriesCanBuild > 0 then
						utable.isCon = true
					else
						utable.isEngineer = true
					end
				end
			end
			if self.scouts[utable.name] or self.raiders[utable.name] or self.battles[utable.name] or self.breaks[utable.name] or self.airgun[utable.name] or self.cloakables[utable.name] or self.amphibious[utable.name] or self.subkillers[utable.name] or self.spiders[utable.name] or self.paralyzers[utable.name] or self.artillerys[utable.name] or self.crawlings[utable.name]then
				utable.isAttacker = true
				--Spring:Echo(utable.name, 'isAttacker')
			end
			utable.bigExplosion = unitDef["deathExplosion"] == "atomic_blast"
			utable.xsize = unitDef["xsize"]
			utable.zsize = unitDef["zsize"]
			utable.wreckName = unitDef["wreckName"]
			self.wrecks[unitDef["wreckName"]] = unitDef["name"]
		end
	end
end

function ArmyHST:GetFeatureTable()
	local featureTable = {}
	-- feature defs
	for featureDefID, featureDef in pairs(FeatureDefs) do
		local ftable = {}
		for i, k in pairs(featureKeysToGet) do
			local v = featureDef[k]
			ftable[k] = v
		end
		if self.wrecks[featureDef["name"]] then
			ftable.unitName = self.wrecks[featureDef["name"]]
		end
		self.featureTable[featureDef.name] = ftable
	end

end

getTechTree(armTechLv)
getTechTree(corTechLv)
for k,v in pairs(corTechLv) do unitsLevels[k] = v end
for k,v in pairs(armTechLv) do unitsLevels[k] = v end
--ArmyHST.unitTable, ArmyHST.wrecks = GetUnitTable()

wrecks = nil

