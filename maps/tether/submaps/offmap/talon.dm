#if MAP_TEST
#include "talon1.dmm"
#include "talon2.dmm"
#endif

/var/const/access_talon = 301
/datum/access/talon
	id = access_talon
	access_type = ACCESS_TYPE_PRIVATE


var/global/list/latejoin_talon = list()
/obj/effect/landmark/talon
	name = "JoinLateTalon"
	delete_me = 1

/obj/effect/landmark/talon/New()
	latejoin_talon += loc // Register this turf as tram latejoin.
	..()

/datum/spawnpoint/talon
	display_name = "ITV Talon Cryo"
	restrict_job = list("Talon Captain", "Talon Pilot", "Talon Engineer", "Talon Doctor", "Talon Guard")
	msg = "has come out of cryostasis"
	announce_channel = "Talon"

/datum/spawnpoint/talon/New()
	..()
	turfs = latejoin_talon

/obj/machinery/cryopod/talon
	announce_channel = "Talon"
	on_store_message = "has entered cryogenic storage."
	on_store_name = "ITV Talon Cryo"
	on_enter_visible_message = "starts climbing into the"
	on_enter_occupant_message = "You feel cool air surround you. You go numb as your senses turn inward."
	on_store_visible_message_1 = "hums and hisses as it moves"
	on_store_visible_message_2 = "into cryogenic storage."

// Map template for spawning the shuttle
/datum/map_template/offmap/talon1
	name = "Offmap Ship - Talon Z1"
	desc = "Offmap spawn ship, the Talon."
	mappath = 'talon1.dmm'
/datum/map_template/offmap/talon2
	name = "Offmap Ship - Talon Z2"
	desc = "Offmap spawn ship, the Talon."
	mappath = 'talon2.dmm'

/obj/effect/landmark/map_data/talon
    height = 2

// The 'ship'
/obj/effect/overmap/visitable/ship/talon
	name = "Talon"
	desc = "A semi-modern make of ship from Haephestus, registered as the Talon."
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_LARGE
	initial_generic_waypoints = list("talon_fore", "talon_aft", "talon_port", "talon_starboard")
	//initial_restricted_waypoints = list("Aro's Ship's Boat" = list("omship_spawn_aroboat"))

/*
/obj/effect/overmap/visitable/ship/aro/get_skybox_representation()
	var/image/I = image('aro.dmi', "skybox")
	I.pixel_x = 200
	I.pixel_y = 200
	return I
*/

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/talonboat
	name = "boat control console"
	shuttle_tag = "Talon's boat"
	req_one_access = list(access_talon)

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/talonboat
	name = "Talon's boat bay"
	base_area = /area/talon/deckone/central_hallway
	base_turf = /turf/simulated/floor/tiled/monotile
	landmark_tag = "offmap_spawn_talonboat"
	docking_controller = "talon_boatbay"
	shuttle_type = /datum/shuttle/autodock/overmap/talonboat

// The 'shuttle'
/datum/shuttle/autodock/overmap/talonboat
	name = "Talon's boat"
	current_location = "offmap_spawn_talonboat"
	docking_controller_tag = "talonboat_docker"
	shuttle_area = /area/shuttle/talonboat
	fuel_consumption = 2
	defer_initialisation = TRUE

/area/shuttle/talonboat
	name = "Talon's Boat"

/obj/machinery/telecomms/allinone/overmap/talon
	freq_listening = list(PUB_FREQ, TALON_FREQ)

// Contains info for off-map spawn sites
/area/talon/maintenance/deckone_port
	name = "\improper Deck One - Port Maintenance"
/area/talon/maintenance/deckone_starboard
	name = "\improper Deck One - Starboard Maintenance"

/area/talon/maintenance/deckone_port_aft_wing
	name = "\improper Deck One - Aft Port Wing"
/area/talon/maintenance/deckone_starboard_aft_wing
	name = "\improper Deck One - Aft Starboard Wing"
/area/talon/maintenance/deckone_port_fore_wing
	name = "\improper Deck One - Fore Port Wing"
/area/talon/maintenance/deckone_starboard_fore_wing
	name = "\improper Deck One - Fore Starboard Wing"

/area/talon/maintenance/decktwo_port
	name = "\improper Deck Two - Port Maintenance"
/area/talon/maintenance/decktwo_starboard
	name = "\improper Deck Two - Starboard Maintenance"
/area/talon/maintenance/decktwo_aft
	name = "\improper Deck Two - Aft Maintenance"
/area/talon/maintenance/decktwo_solars
	name = "\improper Deck Two - Ext Solars"


/area/talon/deckone/central_hallway
	name = "\improper Deck One - Central Hallway"
/area/talon/deckone/bridge_hallway
	name = "\improper Deck One - Bridge Hallway"
/area/talon/deckone/medical
	name = "\improper Deck One - Medical"
/area/talon/deckone/workroom
	name = "\improper Deck One - Workroom"
/area/talon/deckone/brig
	name = "\improper Deck One - Brig"
/area/talon/deckone/port_eng
	name = "\improper Deck One - Port Engineering"
/area/talon/deckone/port_eng_store
	name = "\improper Deck One - Port Eng. Storage"
/area/talon/deckone/starboard_eng
	name = "\improper Deck One - Starboard Engineering"
/area/talon/deckone/starboard_eng_store
	name = "\improper Deck One - Starboard Eng. Storage"
/area/talon/deckone/armory
	name = "\improper Deck One - Armory"
/area/talon/deckone/secure_storage
	name = "\improper Deck One - Secure Storage"
/area/talon/deckone/bridge
	name = "\improper Deck One - Bridge"
/area/talon/deckone/port_solar
	name = "\improper Deck One - Port Solar Control"
/area/talon/deckone/starboard_solar
	name = "\improper Deck One - Starboard Solar Control"

/area/talon/decktwo/central_hallway
	name = "\improper Deck Two - Central Hallway"
/area/talon/decktwo/pilot_room
	name = "\improper Deck Two - Pilot Cabin"
/area/talon/decktwo/med_room
	name = "\improper Deck Two - Doctor Cabin"
/area/talon/decktwo/eng_room
	name = "\improper Deck Two - Engineer Cabin"
/area/talon/decktwo/sec_room
	name = "\improper Deck Two - Guard Cabin"
/area/talon/decktwo/cap_room
	name = "\improper Deck Two - Captain Cabin"
/area/talon/decktwo/bar
	name = "\improper Deck Two - Bar"
/area/talon/decktwo/tech
	name = "\improper Deck Two - Tech Room"
/area/talon/decktwo/backup_bridge
	name = "\improper Deck Two - Backup Bridge"
/area/talon/decktwo/bridge_upper
	name = "\improper Deck Two - Upper Bridge"