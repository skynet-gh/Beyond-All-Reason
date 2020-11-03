return {
	corack = {
		acceleration = 0.4692,
		brakerate = 2.9325,
		buildcostenergy = 6900,
		buildcostmetal = 470,
		builddistance = 136,
		builder = true,
		buildpic = "CORACK.PNG",
		buildtime = 9700,
		canmove = true,
		category = "BOT MOBILE ALL NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "22 33 25",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Tech Level 2",
		energymake = 14,
		energystorage = 100,
		energyuse = 14,
		explodeas = "mediumexplosiongeneric-builder",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 900,
		maxslope = 20,
		maxvelocity = 1.1,
		maxwaterdepth = 25,
		metalmake = 0.14,
		metalstorage = 100,
		movementclass = "BOT3",
		name = "Advanced Construction Bot",
		objectname = "Units/CORACK.s3o",
		radardistance = 50,
		script = "Units/CORACK.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd-builder",
		sightdistance = 318.5,
		terraformspeed = 900,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.726,
		turnrate = 1075.25,
		upright = true,
		workertime = 180,
		buildoptions = {
			"corfus",
			"corafus",
			"corgant",
			"corageo",
			"corbhmth",
			"cormoho",
			"cormexp",
			"cormmkr",
			"coruwadves",
			"coruwadvms",
			"corarad",
			"corshroud",
			"corfort",
			"corasp",
			"cortarg",
			"corsd",
			"corgate",
			"cortoast",
			"corvipe",
			"cordoom",
			"corflak",
			"corscreamer",
			"cortron",
			"corfmd",
			"corsilo",
			"corint",
			"corbuzz",
			"corlab",
			"coralab",
		},
		customparams = {
			area_mex_def = "cormoho",
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corbots/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -1.11450195313e-05 -6.82949829102",
				collisionvolumescales = "22.0 23.11277771 24.3265991211",
				collisionvolumetype = "Box",
				damage = 800,
				description = "Advanced Construction Bot Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 207,
				object = "Units/corack_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 600,
				description = "Advanced Construction Bot Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 83,
				object = "Units/cor2X2B.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2-builder",
				[2] = "deathceg3-builder",
				[3] = "deathceg4-builder",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture2",
			repair = "repair2",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
	},
}
