/datum/bounty/item/security/recharger
	name = "Rechargers"
	description = "The Nanotrasen Antipiracy Academy is conducting marksmanship exercises. They request that rechargers be shipped."
	reward = CARGO_CRATE_VALUE * 4
	required_count = 3
	wanted_types = list(/obj/machinery/recharger = TRUE)

/datum/bounty/item/security/pepperspray
	name = "Pepperspray"
	description = "Stowaways aboard NCS Twix have damaged vending machines and security is having difficulty apprehending them. We could use some new pepperspray cans."
	reward = CARGO_CRATE_VALUE * 6
	required_count = 4
	wanted_types = list(/obj/item/reagent_containers/spray/pepper = TRUE)

/datum/bounty/item/security/prison_clothes
	name = "Prison Uniforms"
	description = "OFJS Alcatraz has experienced delays in prisoner uniform shipments. If you have any to spare, they can get ahold of some faster."
	reward = CARGO_CRATE_VALUE * 4
	required_count = 4
	wanted_types = list(/obj/item/clothing/under/rank/prisoner = TRUE)

/datum/bounty/item/security/plates
	name = "License Plates"
	description = "As a result of a bad clown spacepod crash, we could use an advance on some of your prisoner's license plates."
	reward = CARGO_CRATE_VALUE * 2
	required_count = 10
	wanted_types = list(/obj/item/stack/license_plates/filled = TRUE)

/datum/bounty/item/security/earmuffs
	name = "Earmuffs"
	description = "Central Command is getting tired of your station's messages. They've ordered that you ship some earmuffs to lessen the annoyance."
	reward = CARGO_CRATE_VALUE * 2
	wanted_types = list(/obj/item/clothing/ears/earmuffs = TRUE)

/datum/bounty/item/security/handcuffs
	name = "Handcuffs"
	description = "A large influx of inmates have arrived at NDS Bastille, but keep trying to escape. Now is the perfect time to ship out spare handcuffs (or restraints)."
	reward = CARGO_CRATE_VALUE * 2
	required_count = 5
	wanted_types = list(/obj/item/restraints/handcuffs = TRUE)


///Bounties that require you to perform documentation and inspection of your department to send to centcom.
/datum/bounty/item/security/paperwork
	name = "Routine Security Inspection"
	description = "Perform a routine security inspection using an N-spect scanner on the following station area:"
	required_count = 1
	wanted_types = list(/obj/item/paper/report = TRUE)
	reward = CARGO_CRATE_VALUE * 5
	var/area/demanded_area

/datum/bounty/item/security/paperwork/New()
	///list of areas for security to choose from to perform an inspection.
	var/static/list/possible_areas = list(\
		/area/maintenance,\
		/area/commons,\
		/area/service,\
		/area/hallway/primary,\
		/area/security/office,\
		/area/security/prison,\
		/area/security/range,\
		/area/security/checkpoint,\
		/area/security/interrogation)
	demanded_area = pick(possible_areas)
	name = name + ": [initial(demanded_area.name)]"
	description = initial(description) + " [initial(demanded_area.name)]"

/datum/bounty/item/security/paperwork/applies_to(obj/O)
	. = ..()
	if(!istype(O, /obj/item/paper/report))
		return FALSE
	var/obj/item/paper/report/slip = O
	if(istype(slip.scanned_area, demanded_area))
		return TRUE
	return FALSE
