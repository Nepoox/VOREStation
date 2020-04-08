#if MAP_TEST
#include "talon1.dmm"
#include "talon2.dmm"
#endif

/var/const/access_talon = 301
/datum/access/talon
	id = access_talon
	access_type = ACCESS_TYPE_PRIVATE

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


/obj/machinery/telecomms/allinone/talon
	freq_listening = list(PUB_FREQ, TALON_FREQ)

/obj/machinery/telecomms/allinone/talon/receive_signal(datum/signal/signal)

	if(!on) // has to be on to receive messages
		return

	if(is_freq_listening(signal)) // detect subspace signals

		signal.data["done"] = 1 // mark the signal as being broadcasted
		signal.data["compression"] = 0

		// Search for the original signal and mark it as done as well
		var/datum/signal/original = signal.data["original"]
		if(original)
			original.data["done"] = 1

		// For some reason level is both used as a list and not a list, and now it needs to be a list.
		// Because this is a 'all in one' machine, we're gonna just cheat.
		if(using_map.use_overmap)
			signal.data["level"] = get_overmap_connections(z, 0)
		else
			signal.data["level"] = using_map.contact_levels.Copy()

		if(signal.data["slow"] > 0)
			sleep(signal.data["slow"]) // simulate the network lag if necessary

		/* ###### Broadcast a message using signal.data ###### */

		var/datum/radio_frequency/connection = signal.data["connection"]

		if(connection.frequency in ANTAG_FREQS) // if antag broadcast, just
			Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"],, signal.data["compression"], list(0), connection.frequency,
							  signal.data["verb"], signal.data["language"])
		else
			if(intercept)
				Broadcast_Message(signal.data["connection"], signal.data["mob"],
							  signal.data["vmask"], signal.data["vmessage"],
							  signal.data["radio"], signal.data["message"],
							  signal.data["name"], signal.data["job"],
							  signal.data["realname"], signal.data["vname"], 3, signal.data["compression"], list(0), connection.frequency,
							  signal.data["verb"], signal.data["language"])



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