
/obj/effect/mob_spawn/ghost_role/human/fugitive
	spawner_job_path = /datum/job/fugitive_hunter
	prompt_name = "Write me some god damn prompt names!"
	you_are_text = "Write me some god damn you are text!"
	flavour_text = "Write me some god damn flavor text!" //the flavor text will be the backstory argument called on the antagonist's greet, see hunter.dm for details
	show_flavor = FALSE
	var/back_story = "error"

/obj/effect/mob_spawn/ghost_role/human/fugitive/Initialize(mapload)
	. = ..()
	notify_ghosts("Hunters are waking up looking for refugees!", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE, ignore_key = POLL_IGNORE_FUGITIVE)

/obj/effect/mob_spawn/ghost_role/human/fugitive/special(mob/living/carbon/human/spawned_human)
	. = ..()
	var/datum/antagonist/fugitive_hunter/fughunter = new
	fughunter.backstory = back_story
	spawned_human.mind.add_antag_datum(fughunter)
	fughunter.greet()
	message_admins("[ADMIN_LOOKUPFLW(spawned_human)] has been made into a Fugitive Hunter by an event.")
	log_game("[key_name(spawned_human)] was spawned as a Fugitive Hunter by an event.")

/obj/effect/mob_spawn/ghost_role/human/fugitive/spacepol
	name = "marshal pod"
	desc = "A small sleeper typically used to put people to sleep for briefing on the mission. This one has a small Orion Commonwealths flag and a Federal Marshal badge stenciled on the side."
	prompt_name = "a federal marshal"
	you_are_text = "I am an Orion Commonwealths Federal Marshal!"
	flavour_text = "Justice has arrived. Someone or something has irked the corpos and local commonwealth enough to call \
		us Feds in to clean up their mess."
	back_story = "space cop"
	outfit = /datum/outfit/marshal
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"

/obj/effect/mob_spawn/ghost_role/human/fugitive/sinosiberian
	name = "sinosiberian pod"
	desc = "A small sleeper typically used to make long distance travel a bit more bearable. This one has a small flag of the USR printed on its side."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	faction = list("sinosiberian")
	prompt_name = "a sinosiberian"
	you_are_text = "I am a Sinosiberian smuggler!"
	flavour_text = "PIHUA!! We were mid-flight when our cargo slipped out an airlock! Must be aboard this nearby space station somewhere? \
		We must \"legally\" reaquire it by any means necessary and without getting the government involved - is our property, after all!"
	back_story = "sinosiberian"
	outfit = /datum/outfit/sinosiberian_hunter

/obj/effect/mob_spawn/ghost_role/human/fugitive/sinosiberian/leader
	name = "sinosiberian commandant pod"
	you_are_text = "I am the commandant of a Sinosiberian smuggler ring!"
	outfit = /datum/outfit/sinosiberian_hunter/leader

/obj/effect/mob_spawn/ghost_role/human/fugitive/bounty
	name = "bounty hunter pod"
	prompt_name = "a bounty hunter"
	you_are_text = "I'm a bounty hunter."
	flavour_text = "We got a new bounty on some fugitives from the sector sheriff; dead or alive."
	back_story = "bounty hunters"
	desc = "A small sleeper typically used to make long distance travel a bit more bearable."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"

/obj/effect/mob_spawn/ghost_role/human/fugitive/bounty/Destroy()
	var/obj/structure/fluff/empty_sleeper/S = new(drop_location())
	S.setDir(dir)
	return ..()

/obj/effect/mob_spawn/ghost_role/human/fugitive/bounty/armor
	outfit = /datum/outfit/bountyarmor

/obj/effect/mob_spawn/ghost_role/human/fugitive/bounty/hook
	outfit = /datum/outfit/bountyhook

/obj/effect/mob_spawn/ghost_role/human/fugitive/bounty/synth
	outfit = /datum/outfit/bountysynth
