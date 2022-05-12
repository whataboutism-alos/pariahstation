/mob/living/simple_animal/hostile/sinosiberian
	name = "Sinosiberian Pirate"
	desc = "Never able to accept the peacetime brought on by the Orion Commonwealths' inception, a percentage of dogmatic Sinosiberian naval personnel fled to deep space aboard ships with likeminded crews. \Now their descendents terrorize the outer systems in acts of piracy."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "sinosiberianmelee"
	icon_living = "sinosiberianmelee"
	icon_dead = "sinosiberianmelee_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	speed = 0
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	loot = list(/obj/effect/mob_spawn/corpse/human/sinosiberian,
				/obj/item/knife/kitchen)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 7.5
	faction = list("sinosiberian")
	status_flags = CANPUSH
	del_on_death = 1

	footstep_type = FOOTSTEP_MOB_SHOE


/mob/living/simple_animal/hostile/sinosiberian/ranged
	icon_state = "sinosiberianranged"
	icon_living = "sinosiberianranged"
	loot = list(/obj/effect/mob_spawn/corpse/human/sinosiberian/ranged,
				/obj/item/gun/ballistic/revolver/nagant)
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	projectilesound = 'sound/weapons/gun/revolver/shot.ogg'
	casingtype = /obj/item/ammo_casing/n762


/mob/living/simple_animal/hostile/sinosiberian/ranged/mosin
	loot = list(/obj/effect/mob_spawn/corpse/human/sinosiberian/ranged,
				/obj/item/gun/ballistic/rifle/boltaction)
	casingtype = /obj/item/ammo_casing/a762

/mob/living/simple_animal/hostile/sinosiberian/ranged/trooper
	icon_state = "sinosiberianrangedelite"
	icon_living = "sinosiberianrangedelite"
	maxHealth = 150
	health = 150
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	loot = list(/obj/effect/mob_spawn/corpse/human/sinosiberian/ranged/trooper,
				/obj/item/gun/ballistic/shotgun/lethal)

/mob/living/simple_animal/hostile/sinosiberian/ranged/officer
	name = "sinosiberian Officer"
	icon_state = "sinosiberianofficer"
	icon_living = "sinosiberianofficer"
	maxHealth = 65
	health = 65
	rapid = 3
	casingtype = /obj/item/ammo_casing/c9mm
	loot = list(/obj/effect/mob_spawn/corpse/human/sinosiberian/ranged/officer,
				/obj/item/gun/ballistic/automatic/pistol/aps)

/mob/living/simple_animal/hostile/sinosiberian/ranged/officer/Aggro()
	..()
	summon_backup(15)
	say("Dawo zhebiaen lai, jianzhai!!!")
