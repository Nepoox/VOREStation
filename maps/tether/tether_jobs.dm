///////////////////////////////////
//// Talon Jobs
/datum/job/talon
	faction = "Neutral"
	departments = list(DEPARTMENT_TALON)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#aaaaaa"
	economic_modifier = 5
	minimal_player_age = 14
	pto_type = null
	access = list(access_talon)
	minimal_access = list(access_talon)

/datum/job/talon/captain
	title = "Captain"
	economic_modifier = 7
	job_description = "The captain's job is to generate profit through trade or other means such as salvage or even privateering."
	outfit_type = /decl/hierarchy/outfit/job/talon_captain

/datum/job/talon/doctor
	title = "Doctor"
	job_description = "The doctor's job is to make sure the crew of the ITV Talon remain in good health and to monitor them when away from the ship."
	outfit_type = /decl/hierarchy/outfit/job/talon_doctor

/datum/job/talon/engineer
	title = "Engineer"
	job_description = "The engineer's job is to ensure the ITV Talon remains in tip-top shape and to repair any damage as well as manage the shields."
	outfit_type = /decl/hierarchy/outfit/job/talon_engineer

/datum/job/talon/pilot
	title = "Pilot"
	job_description = "The pilot's job is to fly the ITV Talon in the most efficient and profitable way possible."
	outfit_type = /decl/hierarchy/outfit/job/talon_pilot

/datum/job/talon/guard
	title = "Guard"
	job_description = "The guard's job is to keep the crew of the ITV Talon safe and ensure the captain's wishes are carried out."
	outfit_type = /decl/hierarchy/outfit/job/talon_security

/decl/hierarchy/outfit/job/talon_captain
	name = OUTFIT_JOB_NAME("Talon Captain")

	id_type = /obj/item/weapon/card/id/gold
	pda_type = /obj/item/device/pda/captain

	l_ear = /obj/item/device/radio/headset/talon
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	shoes = /obj/item/clothing/shoes/brown
	backpack = /obj/item/weapon/storage/backpack/captain
	satchel_one = /obj/item/weapon/storage/backpack/satchel/cap
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/talon_pilot
	name = OUTFIT_JOB_NAME("Talon Pilot")
	id_pda_assignment = "Pilot"

	id_slot = slot_wear_id
	pda_slot = slot_belt
	pda_type = /obj/item/device/pda
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_COMPREHENSIVE_SURVIVAL

	l_ear = /obj/item/device/radio/headset/talon
	shoes = /obj/item/clothing/shoes/black
	uniform = /obj/item/clothing/under/rank/pilot1
	suit = /obj/item/clothing/suit/storage/toggle/bomber/pilot
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/fakesunglasses/aviator

/decl/hierarchy/outfit/job/talon_doctor
	name = OUTFIT_JOB_NAME("Talon Doctor")
	hierarchy_type = /decl/hierarchy/outfit/job

	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/medical
	id_type = /obj/item/weapon/card/id/medical

	l_ear = /obj/item/device/radio/headset/talon
	shoes = /obj/item/clothing/shoes/white
	backpack = /obj/item/weapon/storage/backpack/medic
	satchel_one = /obj/item/weapon/storage/backpack/satchel/med
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/med
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/weapon/storage/firstaid/regular
	r_pocket = /obj/item/device/flashlight/pen

/decl/hierarchy/outfit/job/talon_security
	name = OUTFIT_JOB_NAME("Talon Security")
	hierarchy_type = /decl/hierarchy/outfit/job

	pda_type = /obj/item/device/pda/security
	id_type = /obj/item/weapon/card/id/security
	backpack_contents = list(/obj/item/weapon/handcuffs = 1)

	l_ear = /obj/item/device/radio/headset/talon
	gloves = /obj/item/clothing/gloves/black
	shoes = /obj/item/clothing/shoes/boots/jackboots
	backpack = /obj/item/weapon/storage/backpack/security
	satchel_one = /obj/item/weapon/storage/backpack/satchel/sec
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/sec
	uniform = /obj/item/clothing/under/rank/security
	l_pocket = /obj/item/device/flash

/decl/hierarchy/outfit/job/talon_engineer
	name = OUTFIT_JOB_NAME("Talon Engineer")
	hierarchy_type = /decl/hierarchy/outfit/job

	pda_slot = slot_l_store
	pda_type = /obj/item/device/pda/atmos
	id_type = /obj/item/weapon/card/id/engineering
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

	l_ear = /obj/item/device/radio/headset/talon
	belt = /obj/item/weapon/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/boots/workboots
	r_pocket = /obj/item/device/t_scanner
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one = /obj/item/weapon/storage/backpack/satchel/eng
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/engi
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	belt = /obj/item/weapon/storage/belt/utility/atmostech
