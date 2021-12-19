if(released < array_length(enemy)){
	enemy[released].release = true;
	
	with(enemy[released].target){
		path_start(global.path[irandom(2)], 3*boost, path_action_restart, true);
	}
	
	released++;
	alarm[0] = AIrelease;
}

