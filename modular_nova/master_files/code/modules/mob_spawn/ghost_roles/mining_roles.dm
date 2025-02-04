/// Lavaland Hermit

/obj/effect/mob_spawn/ghost_role/human/hermit
	quirks_enabled = TRUE // ghost role quirks
	random_appearance = FALSE // ghost role prefs

/// Beach Dome

/obj/effect/mob_spawn/ghost_role/human/beach
	quirks_enabled = TRUE
	random_appearance = FALSE

/// Space Bar

/obj/effect/mob_spawn/ghost_role/human/bartender
	quirks_enabled = TRUE
	random_appearance = FALSE

/// Preserved Terrarium

/obj/effect/mob_spawn/ghost_role/human/seed_vault
	restricted_species = list(/datum/species/pod)
	quirks_enabled = TRUE
	random_appearance = FALSE

/// Ashwalker Camp

/obj/effect/mob_spawn/ghost_role/human/ash_walker
	restricted_species = list(/datum/species/lizard/ashwalker)
	random_appearance = FALSE

/// Listening Outpost

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/comms/space
	outfit = /datum/outfit/lavaland_syndicate/comms/space
	loadout_enabled = TRUE
	quirks_enabled = TRUE
	random_appearance = FALSE

// OUTFITS

/datum/outfit/lavaland_syndicate/comms
	uniform = /obj/item/clothing/under/rank/security/nova/utility/redsec/syndicate
	ears = /obj/item/radio/headset/interdyne/comms

/datum/outfit/lavaland_syndicate/comms/space
	ears = /obj/item/radio/headset/syndicate/alt

/// Interdyne Planetary Base(s)

// SPAWNERS

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base
	name = "Interdyne Bioweapon Scientist"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "an Interdyne bioweapon scientist"
	you_are_text = "You are a science technician employed in an Interdyne research facility developing biological weapons."
	flavour_text = "Interdyne middle management has relayed that Nanotrasen is actively mining in this sector. A deal with the Syndicate remains, powering the quantum pad to their rumored starship in the system. Continue your research as best you can, and try to keep out of trouble."
	important_text = "The base is rigged with explosives, DO NOT abandon it or let it fall into enemy hands!"
	outfit = /datum/outfit/interdyne_planetary_base
	spawner_job_path = /datum/job/interdyne_planetary_base
	loadout_enabled = TRUE
	quirks_enabled = TRUE
	random_appearance = FALSE

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/special(mob/living/new_spawn)
	. = ..()
	new_spawn.grant_language(/datum/language/codespeak, source = LANGUAGE_SPAWNER)

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/ice
	outfit = /datum/outfit/interdyne_planetary_base/ice
	interdyne_planetary_base_icebox
	flavour_text = "Interdyne middle management has relayed that Nanotrasen is actively mining in this sector. A deal with the Syndicate remains, but their starship has left the system, leaving our quantum pad without a purpose. Continue your research as best you can, and try to keep out of trouble."
	spawner_job_path = /datum/job/interdyne_planetary_base_icebox

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/shaftminer
	name = "Interdyne Shaft Miner"
	prompt_name = "an Interdyne shaft miner"
	you_are_text = "You are a shaft miner, employed in an Interdyne research facility developing biological weapons."
	outfit = /datum/outfit/interdyne_planetary_base/shaftminer

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/shaftminer/ice
	outfit = /datum/outfit/interdyne_planetary_base/shaftminer/ice
	flavour_text = "Interdyne middle management has relayed that Nanotrasen is actively mining in this sector. A deal with the Syndicate remains, but their starship has left the system, leaving our quantum pad without a purpose. Continue your research as best you can, and try to keep out of trouble."
	spawner_job_path = /datum/job/interdyne_planetary_base_icebox

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/deck_officer
	name = "Interdyne Deck Officer"
	prompt_name = "an Interdyne deck officer"
	you_are_text = "You are a Deck Officer, employed in an Interdyne research facility developing biological weapons."
	outfit = /datum/outfit/interdyne_planetary_base/shaftminer/deckofficer

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/deck_officer/ice
	flavour_text = "Interdyne middle management has relayed that Nanotrasen is actively mining in this sector. A deal with the Syndicate remains, but their starship has left the system, leaving our quantum pad without a purpose. Continue your research as best you can, and try to keep out of trouble."
	spawner_job_path = /datum/job/interdyne_planetary_base_icebox

// OUTFITS

/datum/outfit/interdyne_planetary_base
	name = "Interdyne Bioweapon Scientist"
	id = /obj/item/card/id/advanced/chameleon
	id_trim = /datum/id_trim/syndicom/nova/interdyne
	uniform = /obj/item/clothing/under/rank/rnd/scientist/nova/utility/syndicate
	suit = /obj/item/clothing/suit/toggle/labcoat/interdyne
	back = /obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/storage/box/survival/interdyne=1,
		/obj/item/storage/box/nif_ghost_box/ghost_role=1,
		/obj/item/healthanalyzer/simple/disease=1,
	)
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/interdyne
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/gun/ballistic/automatic/pistol
	r_hand = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/sindano/evil
	implants = list(/obj/item/implant/weapons_auth)
	var/jobtype = /datum/job/interdyne_planetary_base

/datum/outfit/interdyne_planetary_base/post_equip(mob/living/carbon/human/syndicate, visualsOnly = FALSE)
	syndicate.faction |= ROLE_SYNDICATE

	var/obj/item/card/id/id_card = syndicate.wear_id
	if(istype(id_card))
		id_card.registered_name = syndicate.real_name
		id_card.update_label()
		id_card.update_icon()

	handlebank(syndicate)
	return ..()

/datum/outfit/interdyne_planetary_base/ice
	uniform = /obj/item/clothing/under/syndicate/nova/tactical
	suit = /obj/item/clothing/suit/hooded/wintercoat/nova/syndicate
	ears = /obj/item/radio/headset/interdyne
	backpack_contents = list(
		/obj/item/storage/box/survival/interdyne=1,
		/obj/item/storage/box/nif_ghost_box/ghost_role=1,
		/obj/item/healthanalyzer/simple/disease=1,
		/obj/item/clothing/suit/toggle/labcoat/interdyne=1,
	)

/datum/outfit/interdyne_planetary_base/shaftminer
	name = "Interdyne Shaft Miner"
	uniform = /obj/item/clothing/under/rank/cargo/tech/nova/utility/syndicate
	suit = null //Subtype moment
	r_pocket = /obj/item/storage/bag/ore
	id_trim = /datum/id_trim/syndicom/nova/interdyne/shaftminer
	backpack_contents = list(
		/obj/item/storage/box/survival/interdyne=1,
		/obj/item/storage/box/nif_ghost_box/ghost_role=1,
		/obj/item/flashlight/seclite=1,
		/obj/item/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/recharge/kinetic_accelerator=1,
		/obj/item/stack/marker_beacon/ten=1,
	)

/datum/outfit/interdyne_planetary_base/shaftminer/deckofficer
	name = "Interdyne Deck Officer"
	uniform = /obj/item/clothing/under/rank/cargo/qm/nova/interdyne
	neck = /obj/item/clothing/neck/cloak/qm/nova/interdyne
	ears = /obj/item/radio/headset/interdyne/command
	id = /obj/item/card/id/advanced/chameleon/black/silver
	id_trim = /datum/id_trim/syndicom/nova/interdyne/deckofficer

/obj/effect/mob_spawn/ghost_role/human/interdyne_planetary_base/deckofficer/Destroy()
	new/obj/structure/fluff/empty_sleeper/syndicate/captain(get_turf(src))
	return ..()

/datum/outfit/interdyne_planetary_base/shaftminer/ice
	name = "Icemoon Interdyne Shaft Miner"
	uniform = /obj/item/clothing/under/syndicate/nova/tactical
	suit = /obj/item/clothing/suit/hooded/wintercoat/nova/syndicate

// ITEMS

/obj/item/radio/headset/interdyne
	name = "\improper Interdyne headset"
	desc = "A bowman headset with a large red cross on the earpiece, has a small 'IP' written on the top strap. Protects the ears from flashbangs."
	icon_state = "syndie_headset"
	inhand_icon_state = null
	radiosound = 'modular_nova/modules/radiosound/sound/radio/syndie.ogg'
	keyslot = new /obj/item/encryptionkey/headset_syndicate/interdyne

/obj/item/radio/headset/interdyne/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/interdyne/command
	name = "\improper Interdyne command headset"
	desc = "A commanding headset to gather your underlings. Protects the ears from flashbangs. It has a large red cross on the earpiece, and a small 'IP' written on the top strap. Protects the ears from flashbangs."
	command = TRUE

/obj/item/radio/headset/interdyne/comms
	keyslot = /obj/item/encryptionkey/headset_syndicate/interdyne

// STRUCTURES

/obj/structure/closet/crate/freezer/sansufentanyl
	name = "sansufentanyl crate"
	desc = "A freezer. Contains refrigerated Sansufentanyl, for managing Hereditary Manifold Sickness. A product of Interdyne Pharmaceuticals."

/obj/structure/closet/crate/freezer/sansufentanyl/PopulateContents()
	. = ..()
	for(var/grabbin_pills in 1 to 10)
		new /obj/item/storage/pill_bottle/sansufentanyl(src)
