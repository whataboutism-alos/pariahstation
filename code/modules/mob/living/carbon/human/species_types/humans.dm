/datum/species/human
	name = "\improper Human"
	id = SPECIES_HUMAN
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,HAS_FLESH,HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
	)
	mutant_bodyparts = list("wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH
	liked_food = JUNKFOOD | FRIED
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hairstyle = "Business Hair"
	human.hair_color = "#bb9966" // brown
	human.update_hair()

/datum/species/human/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/human/get_species_description()
	return "Humans are the dominant species in the known galaxy. \
		Their kind extend from old Earth to the edges of known space."

/datum/species/human/get_species_lore()
	return list(
		"While some would identify humans as gregarious or intrepid, others might prefer sinister or \
		conniving. In reality, humanity is capable of producing all these kinds of traits, for it is \
		a race marked by individuality and variety.",
		
		"Humanity in the present day is unified under the Orion Commonwealths, an interstellar nation \
		founded through common interest in preventing a repetition of the devastation brought on by \
		infighting in a series of multi-generational wars retroactively referred to by historians as \
		the Intra-Human Wars.",

		"The Commonwealths' federal government is extremely selective in exercising its authority to \
		prevent overextension, and as a result local matters fall almost exclusively to the regional \
		commonwealth. Most citizens are aware of the bluespace communication services, tax collection, \
		and foreign policy handled by the Orion Commonwealths' federal level, but otherwise it stays \
		out of their lives.",
		
		"Humans from each commonwealth bring with them their cultures and subcultures: while two \
		humans from Epsilon Indi will invariably differ in personality, they will have more in common \
		culturally than with a human from the Union of Sibosiberian Republics, another commonwealth \
		located on Earth’s continent of Asia.",
		
		"One commonality held amongst modern human communities is a value of stability. Humans will \
		welcome change with good cause, but reaching such a point would first require overturning or \
		convincing the most stubborn of individuals that find themselves present in every community.",
	)

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	if(CONFIG_GET(number/default_laws) == 0) // Default lawset is set to Asimov
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "robot",
			SPECIES_PERK_NAME = "Asimov Superiority",
			SPECIES_PERK_DESC = "The AI and their cyborgs are, by default, subservient only \
				to humans. As a human, silicons are required to both protect and obey you.",
		))

	if(CONFIG_GET(flag/enforce_human_authority))
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bullhorn",
			SPECIES_PERK_NAME = "Chain of Command",
			SPECIES_PERK_DESC = "Nanotrasen only recognizes humans for command roles, such as Captain.",
		))

	return to_add
