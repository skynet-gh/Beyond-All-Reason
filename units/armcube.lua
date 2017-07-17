return {
	armcube = {
		acceleration = 0,
		brakerate = 0,
		blocking = true,
		buildangle = 32768,
		buildcostenergy = 750*0.4,
		buildcostmetal = 125*0.4,
		buildpic = "ARMCUBE.DDS",
		buildtime = 2500*0.4,
		buildinggrounddecaldecayspeed = 1,
		buildinggrounddecalsizex = 3,
		buildinggrounddecalsizey = 3,
		canrepeat = false,
		category = "ALL NOTLAND SUBMARINE ",
		corpse = "DEAD",
		description = "Sea Foundations",
		energystorage = 0,
		explodeas = "platformboom",
		footprintx = 4,
		footprintz = 4,
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "48 316 48",
		collisionvolumetype = "Box",
		icontype = "seaplatform",
		idleautoheal = 5,
		idletime = 1800,
		levelground = false,
		maxdamage = 4500,
		maxslope = 89,
		minwaterdepth = 0,
		name = "Platform",
		objectname = "ARMCUBE.3DO",
		seismicsignature = 0,
		selfdestructas = "platformboom",
		sightdistance = 0,
		waterline = 0,
		--script = "armcube.lua",
		usebuildinggrounddecal = false,
		yardmap = "oooooooooooooooo",
		customparams = {
			removewait = true,
			removestop = true,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
               			collisionvolumescales = "35.0 4.0 6.0",
               			collisionvolumetype = "cylY",
				damage = 750,
				description = "Platform Corpse",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 5,
				height = 50,
				hitdensity = 100,
				metal = 24,
				object = "5X5B",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 387,
				description = "Platform Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 12,
				object = "5X5A",
                collisionvolumescales = "35.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak1",
			uncloak = "kloak1un",
			underattack = "warning1",
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
				[1] = "servmed2",
			},
			select = {
				[1] = "servmed2",
			},
		},

		},
	}
