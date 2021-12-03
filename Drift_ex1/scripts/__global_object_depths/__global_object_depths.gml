function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_Car_Base
	global.__objectDepths[1] = 0; // obj_Player
	global.__objectDepths[2] = 0; // obj_NPC
	global.__objectDepths[3] = -1; // obj_NPC_Target
	global.__objectDepths[4] = 0; // obj_Grass_Zone
	global.__objectDepths[5] = 0; // obj_Grass_Zone
	global.__objectDepths[6] = 0; // obj_Grass_Zone
	global.__objectDepths[7] = 0; // obj_Grass_Zone


	global.__objectNames[0] = "obj_Car_Base";
	global.__objectNames[1] = "obj_Player";
	global.__objectNames[2] = "obj_NPC";
	global.__objectNames[3] = "obj_NPC_Target";
	global.__objectNames[4] = "obj_Grass_Zone";
	global.__objectNames[5] = "o_road";
	global.__objectNames[6] = "o_deathZone";
	global.__objectNames[7] = "o_checkpoint";
	


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
