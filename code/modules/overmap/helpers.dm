/proc/get_overmap_sector(var/z)
	if(using_map.use_overmap)
		return map_sectors["[z]"]
	else
		return null

/proc/get_overmap_connections(var/z, var/range = -1)
	var/obj/effect/overmap/visitable/O = get_overmap_sector(z)
	if(!istype(O))
		return list(z)

	//Just the sector we're in
	if(range == -1)
		return O.map_z.Copy()

	//Otherwise every sector we're on top of
	var/list/connections = list()
	var/turf/T = get_turf(O)
	for(var/obj/effect/overmap/visitable/V in range(range, T))
		connections += V.map_z
	return connections
